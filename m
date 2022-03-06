Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECAA34CED8B
	for <lists+linux-usb@lfdr.de>; Sun,  6 Mar 2022 20:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234123AbiCFTup (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 14:50:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233066AbiCFTuo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 14:50:44 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9ABF286FB
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 11:49:51 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id c19so7440079ede.8
        for <linux-usb@vger.kernel.org>; Sun, 06 Mar 2022 11:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:to:cc
         :subject:from:references:in-reply-to;
        bh=XLhPWEmMpHQvyW1W5mtCnNiQBwxzgUcUP7pc39MQlDo=;
        b=J9mSFnx8pNw6ymDvb+L/r4Rx6sDtfA4dvzCBZoOujxf6y3QDqhIR74wtH7rdplirnO
         P7+5TsoDt9VED7FkhLiL+Fh+SBqxrDd6lE+oq1L+znsuoKX0UxlmhS4TkgEi8JTnjKmH
         8b2cx4eTdPltmTiu+w26fLK1IRHKV4wEyZubiW1VKN1hJVd5i4NMgSrysl5ZbF9S13mt
         SI6fXIBdN3WavZDzakmhqASPSLXKAzndBxgpXjrr5iKb65sJXV9hHBbmFGwUvPOt663m
         VjSu3IPRbM6w60UgpPClw1JpU3RZY/cqjLyi1LI6fdsgRl9j1SRlNddchURsy+mgJ72B
         1mPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:to:cc:subject:from:references:in-reply-to;
        bh=XLhPWEmMpHQvyW1W5mtCnNiQBwxzgUcUP7pc39MQlDo=;
        b=spqG/9glhsySKzo+1K8NeLMQ5c0tX6axCxCj72JnJKoaom5LHfmgLz0lGoPec0snQn
         whessT8uHMJPVp/Vm0brE+RlmpVbQLQnUNbMMgAOF0pRfsDApW+RTaID3F4tdSc+QcAJ
         uFLDvd+sVZ8gdjqq70Ozn4aaE+abj7ey8rQNip7UZG/DC85kbxaAnjHYADYbJYb1fvKM
         vz+g3KXfO/T87yMZS+JXWXj5tjynliH9oc32HTHapF2TQqnEK3meeoHvnmcBC2ltO72t
         7f1DCL/2kHovGSpaDuGW4ejYelGNuz49HQBXA5p3ooLlrnxgJWidoA12fh7zwpjPQ1/K
         JUfQ==
X-Gm-Message-State: AOAM531G6cQPcKf8g3q8vLXkUuYZ7fWE/H/sjvqo3HpjW4usVhSltXaI
        P/JrWTyTddiW2b7gS7uyQvPTeHfqH2VeoQ==
X-Google-Smtp-Source: ABdhPJw2RG2oy2Oy2fSY0QO/eH+PHUJGuGyLgmhbD8FqMGhAGU/wkJYmX/6WleyQcaZoWC0j+B4Xgg==
X-Received: by 2002:a05:6402:f2a:b0:415:a3b3:2019 with SMTP id i42-20020a0564020f2a00b00415a3b32019mr7991921eda.177.1646596190483;
        Sun, 06 Mar 2022 11:49:50 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id s8-20020a170906354800b006da9dec91f2sm3709979eja.163.2022.03.06.11.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 11:49:50 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Sun, 06 Mar 2022 19:49:48 +0000
Message-Id: <CID1MUEO000C.WD5GN0N24HV3@arch-thunder>
To:     "Vincent Mailhol" <mailhol.vincent@wanadoo.fr>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 02/10] usb: isp1760: remove redundant max_packet()
 macro
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220306075524.706660-1-mailhol.vincent@wanadoo.fr>
 <20220306075524.706660-3-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20220306075524.706660-3-mailhol.vincent@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Vincent,
Thanks for the patch.

On Sun Mar 6, 2022 at 7:55 AM WET, Vincent Mailhol wrote:

> The function usb_endpoint_maxp() (called by usb_maxpacket()) already
> does the sanitazation of the USB endpoint max packet size. The call to
> max_packet() does the same thing and is thus removed.
>
> The macro max_packet() not being used anymore also gets removed.
>
> CC: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

Thanks for the cleanup, looks good to me.

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
     Rui
> ---
>  drivers/usb/isp1760/isp1760-hcd.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1=
760-hcd.c
> index 79d571f1429b..893becb077d3 100644
> --- a/drivers/usb/isp1760/isp1760-hcd.c
> +++ b/drivers/usb/isp1760/isp1760-hcd.c
> @@ -1768,7 +1768,6 @@ static void qtd_list_free(struct list_head *qtd_lis=
t)
>   * Packetize urb->transfer_buffer into list of packets of size wMaxPacke=
tSize.
>   * Also calculate the PID type (SETUP/IN/OUT) for each packet.
>   */
> -#define max_packet(wMaxPacketSize) ((wMaxPacketSize) & 0x07ff)
>  static void packetize_urb(struct usb_hcd *hcd,
>  		struct urb *urb, struct list_head *head, gfp_t flags)
>  {
> @@ -1809,8 +1808,8 @@ static void packetize_urb(struct usb_hcd *hcd,
>  			packet_type =3D IN_PID;
>  	}
> =20
> -	maxpacketsize =3D max_packet(usb_maxpacket(urb->dev, urb->pipe,
> -						usb_pipeout(urb->pipe)));
> +	maxpacketsize =3D usb_maxpacket(urb->dev, urb->pipe,
> +				      usb_pipeout(urb->pipe));
> =20
>  	/*
>  	 * buffer gets wrapped in one or more qtds;
> --=20
> 2.34.1



