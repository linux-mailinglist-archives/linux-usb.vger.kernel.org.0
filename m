Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6F4C6D94DA
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 13:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237562AbjDFLP6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 07:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237534AbjDFLP5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 07:15:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D13849CC
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680779715;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mJIFUKdbCVxH+e/HWZUZILs1Tdh2bp6w12YNbU+lrBE=;
        b=WngAuUzvCWRSSv+l2PHzkPQvO9HcQWyYTqPMqDIYe5gjEQ94c4hNKIWgw19hnrfrazClxo
        UP2pJk7k5WsXCEiSrWo0kTREyDKRZulqeUuOUNV0QTV6AsQSuN6ORepkuUXl/MIW/BkEuX
        qbL8OaXnKKlYKUHjq9Lp80aTJDOEnz4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-JkeuygKkMy-T00po0h0OGQ-1; Thu, 06 Apr 2023 07:15:14 -0400
X-MC-Unique: JkeuygKkMy-T00po0h0OGQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-5a3c1e28e73so2813036d6.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Apr 2023 04:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680779714; x=1683371714;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mJIFUKdbCVxH+e/HWZUZILs1Tdh2bp6w12YNbU+lrBE=;
        b=5qPWxtCOUS5pQxZeZrCQ2KbEJeWW0fOsh4V2cP65/0io878JK5ao61GFh5LfXeTPxc
         I7qVcCcF4REkehz4kddo/NsyguwJVEtjQIlaeB+xXPFOiaR7GW7XXsqS9u3VrJRudsT4
         7jxqBCezwgm6NFYTqjsJJhzgTecl5X/Id1yosQZVeD04iRczo6yYXfKTgxEG8DxNgApe
         ubDJNE3OgN5GtvbSYhF+8RFBFUrlmf9qqsHDneL1SULdU6qON5o4Oa97iJCCnF0+bXVO
         kOICAmsmVYltBXiMhYJAcFvKqnzwYh/xYZPEfJPTEBCC9aFgR+t324dm2lQuYbXCSdDT
         0Bag==
X-Gm-Message-State: AAQBX9cHs49NMilYAIl3SspJee+mv/UVgc5dmBRDi9Cek5FXcfEgqM8z
        2rxmo3hMoEhPJujqWpjauiMAuPj3CJd+zM+d5hA0UKqC02d8CNrTzlJSsn9gDq+iQgj8W3n5Lbk
        FLPOZimuLKhQMIHnfGO/HIhxcMKeX
X-Received: by 2002:a05:6214:410d:b0:5df:4d41:9560 with SMTP id kc13-20020a056214410d00b005df4d419560mr8365680qvb.0.1680779714109;
        Thu, 06 Apr 2023 04:15:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350acgJFhERoKoMnZoLl+AOfUrAe2JLco/YpvIHdVhTrerf8HDLTi5O4DDcW1RvnctM3ICg9VjA==
X-Received: by 2002:a05:6214:410d:b0:5df:4d41:9560 with SMTP id kc13-20020a056214410d00b005df4d419560mr8365650qvb.0.1680779713836;
        Thu, 06 Apr 2023 04:15:13 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-227-151.dyn.eolo.it. [146.241.227.151])
        by smtp.gmail.com with ESMTPSA id fc2-20020ad44f22000000b005dd8b9345c2sm427343qvb.90.2023.04.06.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 04:15:13 -0700 (PDT)
Message-ID: <d24bcf952c8ceb3fa97b11cab222945b73723052.camel@redhat.com>
Subject: Re: [PATCH] r8152: Advertise support for software timestamping
From:   Paolo Abeni <pabeni@redhat.com>
To:     Matthew Dawson <matthew@mjdsystems.ca>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 06 Apr 2023 13:15:10 +0200
In-Reply-To: <3218086.lGaqSPkdTl@cwmtaff>
References: <3218086.lGaqSPkdTl@cwmtaff>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, 2023-04-05 at 01:26 -0400, Matthew Dawson wrote:
> Since this drivers initial merge, the necessary support for software
> based timestamping has been available.  Advertise support for this
> feature enables the linuxptp project to work with it.
>=20
> Signed-off-by: Matthew Dawson <matthew@mjdsystems.ca>
> Tested-by: Mostafa Ayesh <mostafaayesh@outlook.com>
> ---
>  drivers/net/usb/r8152.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index decb5ba56a259..44f64fd765a7d 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -9132,6 +9132,7 @@ static const struct ethtool_ops ops =3D {
>  	.set_ringparam =3D rtl8152_set_ringparam,
>  	.get_pauseparam =3D rtl8152_get_pauseparam,
>  	.set_pauseparam =3D rtl8152_set_pauseparam,
> +	.get_ts_info =3D ethtool_op_get_ts_info,
>  };
> =20
>  static int rtl8152_ioctl(struct net_device *netdev, struct ifreq *rq, in=
t=20
> cmd)

Does not apply cleanly to net-next due to last line being wrapped.

Please re-spin and specify the target tree into the subj.

Thanks!

Paolo

