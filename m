Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5AF45B5B0
	for <lists+linux-usb@lfdr.de>; Wed, 24 Nov 2021 08:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhKXHnX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Nov 2021 02:43:23 -0500
Received: from cable.insite.cz ([84.242.75.189]:59602 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240329AbhKXHnR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Nov 2021 02:43:17 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id CC8CBA1A3D401;
        Wed, 24 Nov 2021 08:40:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1637739606; bh=RR6fS1gjfUlrQEzKoGRlA/bN1+yJBJngh7CTRgr4QkQ=;
        h=To:From:Subject:Date:From;
        b=A+RIR01TV2JeH+q/F3Ny0Gxi9Ypw3vfJLBNhWOFWKNMFeJ5GGts5XbI727pf3mtEC
         +4bEzFaWVzqoUO4TLg7zuPbGAqCatU7bTHtSVZ2KhXnUGXeMo0swQMvj/Gv/U7xTbv
         2AK1sV01updND2zCXMMV8Vx2/pHUBy9d/EGmOjnw=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZNvF64jlRblS; Wed, 24 Nov 2021 08:40:01 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 0F2A9A1A3D400;
        Wed, 24 Nov 2021 08:40:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1637739601; bh=RR6fS1gjfUlrQEzKoGRlA/bN1+yJBJngh7CTRgr4QkQ=;
        h=To:From:Subject:Date:From;
        b=FQXLSZ8PLRC1FhuH1JtUDu1ws/1pSdZbIajeq9o+AiDfnPI0IUtYpgJ2gfwTr0Tle
         0YDt9zbDB5qyy+8lg7+Tp+4o88NJZf49QOrlznHVwT5ixBl71bMtQIMEOvLiOiG1ne
         jv9kYNhaPzThLg5W2pVjbD72LN5XwzH64lf1QR+4=
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: usb: dwc2: gadget: high-bandwidth (mc > 1) status?
Message-ID: <ea4697fd-8911-3f79-540b-a03214678ccd@ivitera.com>
Date:   Wed, 24 Nov 2021 08:39:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Minas at all,

Please does dwc2 (specifically in BCM2835/RPi) support HS ISOC multiple 
transactions mc > 1 reliably? I found this condition 
https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/usb/dwc2/gadget.c#L4041

	/* High bandwidth ISOC OUT in DDMA not supported */
	if (using_desc_dma(hsotg) && ep_type == USB_ENDPOINT_XFER_ISOC &&
	    !dir_in && mc > 1) {
		dev_err(hsotg->dev,
			"%s: ISOC OUT, DDMA: HB not supported!\n", __func__);
		return -EINVAL;
	}

But I do not know how the Descriptor DMA is critical and whether 
disabling it will affect gadget performance seriously.

I know about the RX FIFO sizing requirement (and TX FIFO too I guess), 
the current default values can be increased for that particular use case 
if needed.

I am trying to learn if it made sense to spend time on adding support 
for high-bandwidth to the UAC2 audio gadget  to allow using larger 
bInterval and mc=2,3 at high samplerates/channel counts (sort of "burst 
mode" similar to UAC3). When doing some CPU-demanding DSP it would help 
to avoid the time-critical handling every 125us microframe. Both OUT and 
IN are important.


Thanks a lot for your expert advice.


Best regards,


Pavel.


