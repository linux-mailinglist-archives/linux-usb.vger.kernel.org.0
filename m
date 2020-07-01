Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBCF21137C
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 21:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgGAT2b convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 1 Jul 2020 15:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbgGAT2a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 15:28:30 -0400
Received: from smtp2.hosting90.cz (smtp2.hosting90.cz [IPv6:2a03:b780:1:0:216:3eff:fe00:24c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B756C08C5C1
        for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2020 12:28:30 -0700 (PDT)
Received: from [46.229.122.58] (helo=[10.10.0.107])
        by smtp2.hosting90.cz with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <Jerry@jrr.cz>)
        id 1jqiPD-0000IR-H7; Wed, 01 Jul 2020 21:28:27 +0200
Subject: Re: [PATCH v4] usbserial: cp210x - icount support for parity error
 checking
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <b4cd2557-9a61-5ccd-32ad-48b0c68bef6b@jrr.cz>
 <20200621085816.GB95977@kroah.com>
 <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
 <20200621095509.GA120230@kroah.com>
 <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
 <20200621135838.GA125568@kroah.com>
 <7bdff86f-0988-2afc-e1a6-35df2931fd5b@jrr.cz>
 <20200622053146.GB134804@kroah.com>
 <838f09f9-4063-1c2c-8b4d-c18dee6c18de@jrr.cz>
 <20200701154257.GF3334@localhost>
From:   Jerry <Jerry@jrr.cz>
Message-ID: <13482d69-b286-b20e-ee3a-f8c5f12aad18@jrr.cz>
Date:   Wed, 1 Jul 2020 21:28:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 SeaMonkey/2.53.2
MIME-Version: 1.0
In-Reply-To: <20200701154257.GF3334@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
X-Antivirus: Clamav/CLEAN
X-Scan-Signature: 2ed922bdee5712e996d48f0f9a39b9da
X-Authenticated-Id: jerry@jrr.cz
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Johan Hovold wrote on 7/1/20 5:42 PM:
> It would be better if could detect both types of overrun.
>
> Did you try moving the purge command at close to after disabling the
> uart?
>
> Or perhaps we can add a "dummy" comm-status command after disabling the
> uart?
Hello
I try to describe more details about this overrun problem:
1) I tried only CP2102 because our company uses it, I have no idea whether 
the same apply for CP2104,2105... or not, I don't have another chip.
2) Maybe I should note I'm always using even parity (because of STM32 
bootloader protocol).
3) I thought the problem is created by unreaded data when closing because 
overrun was reported after closing if GET_COMM_STATUS shown positive 
ulAmountInInQueue before closing. Later I discovered that if I close the 
port, wait, send some data from outside, then open it, I will also get 
HW_OVERRUN flag.
4) So currently I suppose that problem is usually created by any incoming 
data after disabling interface. If I remove UART_DISABLE from close method, 
no overrun ever reported.
5) Unfortunately this overrun is not reported immediately after port 
opening but later after receiving first byte. I didn't find any way how to 
purge nor dummy read this flag before transmitting data.
6) I didn't find this problem in a chip errata and nobody complaining about it.
7) I successfully reproduced the same problem in MS Windows 10. If some 
data arrived to closed port, then I open it, everything is OK but after 
sending request and receiving reply I often get overrun indication from 
Win32 API ClearCommError()
8) I removed HW_OVERRUN checking because I don't want to break anything but 
maybe Linux driver should work the same way as Windows and don't hide this 
problem?
9) I needed just to detect parity error from user space and things 
complicate.  :-)
>>    
>>    /*
>> - * Read how many bytes are waiting in the TX queue.
>> + * Read how many bytes are waiting in the TX queue and update error counters.
>>     */
>> -static int cp210x_get_tx_queue_byte_count(struct usb_serial_port *port,
>> -		u32 *count)
>> +static int cp210x_get_comm_status(struct usb_serial_port *port,
>> +		u32 *tx_count)
>>    {
>>    	struct usb_serial *serial = port->serial;
>>    	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
>> @@ -855,7 +865,17 @@ static int cp210x_get_tx_queue_byte_coun
>>    			0, port_priv->bInterfaceNumber, sts, sizeof(*sts),
>>    			USB_CTRL_GET_TIMEOUT);
>>    	if (result == sizeof(*sts)) {
>> -		*count = le32_to_cpu(sts->ulAmountInOutQueue);
>> +		u32 flags = le32_to_cpu(sts->ulErrors);
>> +		if (flags & CP210X_SERIAL_ERR_BREAK)
>> +			port->icount.brk++;
>> +		if (flags & CP210X_SERIAL_ERR_FRAME)
>> +			port->icount.frame++;
>> +		if (flags & CP210X_SERIAL_ERR_QUEUE_OVERRUN)
>> +			port->icount.overrun++;
>> +		if (flags & CP210X_SERIAL_ERR_PARITY)
>> +			port->icount.parity++;
>> +		if (tx_count)
>> +			*tx_count = le32_to_cpu(sts->ulAmountInOutQueue);
>>    		result = 0;
>>    	} else {
>>    		dev_err(&port->dev, "failed to get comm status: %d\n", result);
>> @@ -873,13 +893,26 @@ static bool cp210x_tx_empty(struct usb_s
>>    	int err;
>>    	u32 count;
>>    
>> -	err = cp210x_get_tx_queue_byte_count(port, &count);
>> +	err = cp210x_get_comm_status(port, &count);
>>    	if (err)
>>    		return true;
>>    
>>    	return !count;
>>    }
> It seems a bit weird to be updating the error counters while polling
> for tx-empty during close. How about having cp210x_get_comm_status()
> take two u32 pointers for tx_count and errors and only pass in one or
> the other from cp210x_tx_empty() and cp210x_get_icount() respectively?
I suppose that GET_COMM_STATUS reads and CLEAR pending error flags (not 
explained in datasheet but behaves that way). So if some errors are 
reported during cp210x_tx_empty() it can be either counted immediately or 
lost. I'm not sure if cp210x_tx_empty() is called ONLY during close but 
seems be more consistent to count every detected error regardless who calls 
GET_COMM_STATUS.
>> +static int cp210x_get_icount(struct tty_struct *tty,
>> +		struct serial_icounter_struct *icount)
>> +{
>> +	struct usb_serial_port *port = tty->driver_data;
>> +	int result;
>> +
>> +	result = cp210x_get_comm_status(port, NULL);
>> +	if (result)
>> +		return result;
> And then you update the error counters here, preferably under the port
> lock.
>
I wasn't sure about port lock. I looked in several usb drivers (ftdi, 
pl2303) and it seems that port->icount.xxx increments are usually done out 
of lock. But if you wish I put increments into 
spin_lock_irqsave(&port->lock, flags), correct?

> Johan
Jerry


