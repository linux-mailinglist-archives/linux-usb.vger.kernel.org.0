Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 174BF50B89F
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 15:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448051AbiDVNhp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 09:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237165AbiDVNhp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 09:37:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A6B58E47
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 06:34:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E6015620B2
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 13:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39D1C385A4;
        Fri, 22 Apr 2022 13:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650634491;
        bh=vd6u0UozlTEEf15O2ruFLtq2HzjD/Rxzs05SuphedR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QDEhIRBy8l4gIiotPSBzLctjLK0kM5/fNW7xxC1eKNW9iYDUT9agd+W6Xi5eIt124
         PdWt04KIGGnhxY+4A72hdHBTh7hPwGtkjV/o6wlQsgL0VyXF7yK6MkpJdUwfmGkB5z
         1j/U0of8wrCY8Jq1QPMcUop7TiyXCVwhq0Lm44cQ=
Date:   Fri, 22 Apr 2022 15:34:48 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH] usb: common: debug: Hex dump non-standard control
 requests
Message-ID: <YmKu+N0tTlNgkfxq@kroah.com>
References: <bf1e225b660d0bb68ccdb3ce1bd7bd2d33edb817.1648253632.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf1e225b660d0bb68ccdb3ce1bd7bd2d33edb817.1648253632.git.Thinh.Nguyen@synopsys.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 25, 2022 at 05:33:04PM -0700, Thinh Nguyen wrote:
> usb_decode_ctrl() only decodes standard control requests. Don't attempt
> to decode non-standard requests. Just dump the content of the requests.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/common/debug.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
> index 075f6b1b2a1a..cb38725f9276 100644
> --- a/drivers/usb/common/debug.c
> +++ b/drivers/usb/common/debug.c
> @@ -208,6 +208,20 @@ static void usb_decode_set_isoch_delay(__u8 wValue, char *str, size_t size)
>  	snprintf(str, size, "Set Isochronous Delay(Delay = %d ns)", wValue);
>  }
>  
> +static void usb_hex_dump_ctrl(char *str, size_t size, __u8 bRequestType,
> +			      __u8 bRequest, __u16 wValue, __u16 wIndex,
> +			      __u16 wLength)
> +{
> +	snprintf(str, size, "%02x %02x %02x %02x %02x %02x %02x %02x",
> +		 bRequestType, bRequest,
> +		 (u8)(cpu_to_le16(wValue) & 0xff),
> +		 (u8)(cpu_to_le16(wValue) >> 8),
> +		 (u8)(cpu_to_le16(wIndex) & 0xff),
> +		 (u8)(cpu_to_le16(wIndex) >> 8),
> +		 (u8)(cpu_to_le16(wLength) & 0xff),
> +		 (u8)(cpu_to_le16(wLength) >> 8));
> +}
> +
>  /**
>   * usb_decode_ctrl - Returns human readable representation of control request.
>   * @str: buffer to return a human-readable representation of control request.
> @@ -233,6 +247,12 @@ const char *usb_decode_ctrl(char *str, size_t size, __u8 bRequestType,
>  			    __u8 bRequest, __u16 wValue, __u16 wIndex,
>  			    __u16 wLength)
>  {
> +	if ((bRequestType & USB_TYPE_MASK) != USB_TYPE_STANDARD) {
> +		usb_hex_dump_ctrl(str, size, bRequestType, bRequest,
> +				  wValue, wIndex, wLength);
> +		return str;
> +	}

But why not try to decode the other types and say what they are?
Wouldn't that be more helpful?

thanks,

greg k-h
