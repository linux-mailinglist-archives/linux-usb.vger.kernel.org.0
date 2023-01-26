Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D12467C894
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 11:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjAZKa3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 05:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbjAZKa1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 05:30:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62034346C
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 02:30:24 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B4402B3;
        Thu, 26 Jan 2023 11:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674729023;
        bh=E9tX4NfZojW8A+eU5f08Co410hxBquRyYEnZkPr6UJw=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=SA+XQFWC9B8TbLl+u8NUssgNqrQDhaC4WEbpaGCPE5m2s1r/VsA10wYpECp5jN3hT
         tqCtXH2mnBydBZQp4zIHDNdHe6Hsf7Xg2nO6/umEaE3f0zdxoOL/HuKoeaar/QQvag
         n7XIaKQ7H3kvLnz4F9LQ0kQTA+AwTvwzPsOHxiRQ=
Message-ID: <dda24f8e-8d74-c6c1-ae7c-e423bc50a143@ideasonboard.com>
Date:   Thu, 26 Jan 2023 10:30:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <9ce226b4-90c6-94c4-a5ad-bd623409bc51@ideasonboard.com>
 <20230126002017.tbxc3j6xdgplncfs@synopsys.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: Explicit status phase for DWC3
In-Reply-To: <20230126002017.tbxc3j6xdgplncfs@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh

On 26/01/2023 00:20, Thinh Nguyen wrote:
> On Tue, Jan 24, 2023, Dan Scally wrote:
>> Hi Thinh
>>
>>
>> I'm trying to update the DWC3 driver to allow the status phase of a
>> transaction to be explicit; meaning the gadget driver has the choice to
>> either Ack or Stall _after_ the data phase so that the contents of the data
>> phase can be validated. I thought that I should be able to achieve this by
>> preventing dwc3_ep0_xfernotready() from calling dwc3_ep0_do_control_status()
>> (relying on an "explicit_status" flag added to the usb_request to decide
>> whether or not to do so) and then calling it manually later once the data
>> phase was validated by the gadget driver (or indeed userspace). A very
>> barebones version of my attempt to do that looks like this:
>>
> We shouldn't do this. At the protocol level, there must be better ways
> to do handshake than relying on protocol STALL _after_ the data stage.
> Note that not all controllers support this.


Maybe I'm misunderstanding, but isn't this how the USB spec expects it 
to work? Reading "Reporting Status Results (8.5.3.1)" in the USB 2.0 
spec for the status stage in a control write it says "The function 
responds with either a handshake or a zero-length data packet to 
indicate its current status", and the handshake can be either STALL or 
NAK. If we can't do this, how else can we indicate to the host that the 
data sent during a control out transfer is in some way invalid?


Thanks

Dan

>
> Thanks,
> Thinh
