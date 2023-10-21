Return-Path: <linux-usb+bounces-2043-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DFD7D1DCA
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 17:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C06E32822EF
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 15:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE23171CC;
	Sat, 21 Oct 2023 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SDlIfAu3"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A92312E5C
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 15:05:36 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5FC0106
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 08:05:30 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c9c496c114so118385ad.0
        for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697900730; x=1698505530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8KjYiWmBScABIuDtiMMncZnICHnoOPuW6DFu0n03Co=;
        b=SDlIfAu3s6+n8hsKGnhmsqC8Br5Oyt13S1ImxgsR2tqN/MNMJB1vC633Vm3HhS1io1
         aUuoH+7k+uQ0R2FrFTejqwmL6Qhx+Av8ZCaF6Zvt6tiTUc8RR1G3LjR2B410BHSekSnc
         6Lej37Yce3nzEJACeUN7NSKOEoBM3bHvmr8xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697900730; x=1698505530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8KjYiWmBScABIuDtiMMncZnICHnoOPuW6DFu0n03Co=;
        b=WSxEHu0aOTu4jYQYprpOm2BoyxWliqjaLr004421SzxN7SY1yhHpS3a0OFkpNR5gWW
         CuEz0OiLMyQOACnysGF3k3dJPN+fCbh7w1OmpEklFY187GlDdtujOoKiqCDXqWQjsqNd
         yxpCouRVrCJtSUGpZIKq0g+qq28eJsrE4pgHIPFeYsS6BoP7cUmL0DCOT3u+/oa9yG7F
         mWVZaf8vRaL0DO2bFi5D5XZblpwGno/vEsAro6IEoohWmOeeplVcZLD3CHo+UAgQ00fr
         RExJiwF99oKsZtdwTBeRs+JMYmWVKU4B5pG6Tf8bjOIHcUh5mmQhKB/TLrnxBQF5GRIL
         Pv0A==
X-Gm-Message-State: AOJu0YzOStEU061G5Nbkz1cKjWug2+S2a6q6VG34W4bg3x8ZLUvh3Zfm
	cm4UrG9LzMvP7/TBjnMBkx5sPXoE/g630vs03JaulA==
X-Google-Smtp-Source: AGHT+IFZM53rLwdSL4zLJjFCgja09RLXFY4PbcwJmF4VO64lGjKNAOvBSbN9z57Vmt/saKmcBQTSDgpDDrsTUJkcJPI=
X-Received: by 2002:a17:902:f70d:b0:1c9:c480:1797 with SMTP id
 h13-20020a170902f70d00b001c9c4801797mr383690plo.11.1697900729915; Sat, 21 Oct
 2023 08:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020210751.3415723-1-dianders@chromium.org> <20231020140655.v5.6.I6405b1587446c157c6d6263957571f2b11f330a7@changeid>
In-Reply-To: <20231020140655.v5.6.I6405b1587446c157c6d6263957571f2b11f330a7@changeid>
From: Grant Grundler <grundler@chromium.org>
Date: Sat, 21 Oct 2023 08:05:18 -0700
Message-ID: <CANEJEGudwc1=f69L5TAB4+Bdv0aa+y6BQCfLwoDgQ8dizx2=5A@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] r8152: Check for unplug in r8153b_ups_en() / r8153c_ups_en()
To: Douglas Anderson <dianders@chromium.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Hayes Wang <hayeswang@realtek.com>, 
	"David S . Miller" <davem@davemloft.net>, Edward Hill <ecgh@chromium.org>, 
	Laura Nao <laura.nao@collabora.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Simon Horman <horms@kernel.org>, linux-usb@vger.kernel.org, 
	Grant Grundler <grundler@chromium.org>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 2:08=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> If the adapter is unplugged while we're looping in r8153b_ups_en() /
> r8153c_ups_en() we could end up looping for 10 seconds (20 ms * 500
> loops). Add code similar to what's done in other places in the driver
> to check for unplug and bail.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Grant Grundler <grundler@chromium.org>

> ---
>
> (no changes since v2)
>
> Changes in v2:
> - ("Check for unplug in r8153b_ups_en() / r8153c_ups_en()") new for v2.
>
>  drivers/net/usb/r8152.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 9888bc43e903..982f9ca03e7a 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -3663,6 +3663,8 @@ static void r8153b_ups_en(struct r8152 *tp, bool en=
able)
>                         int i;
>
>                         for (i =3D 0; i < 500; i++) {
> +                               if (test_bit(RTL8152_UNPLUG, &tp->flags))
> +                                       return;
>                                 if (ocp_read_word(tp, MCU_TYPE_PLA, PLA_B=
OOT_CTRL) &
>                                     AUTOLOAD_DONE)
>                                         break;
> @@ -3703,6 +3705,8 @@ static void r8153c_ups_en(struct r8152 *tp, bool en=
able)
>                         int i;
>
>                         for (i =3D 0; i < 500; i++) {
> +                               if (test_bit(RTL8152_UNPLUG, &tp->flags))
> +                                       return;
>                                 if (ocp_read_word(tp, MCU_TYPE_PLA, PLA_B=
OOT_CTRL) &
>                                     AUTOLOAD_DONE)
>                                         break;
> --
> 2.42.0.758.gaed0368e0e-goog
>

