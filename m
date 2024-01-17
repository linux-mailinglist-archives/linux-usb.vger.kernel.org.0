Return-Path: <linux-usb+bounces-5167-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4042F8304C4
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 12:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D1721C24444
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 11:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DDF1DFE8;
	Wed, 17 Jan 2024 11:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JpoLOPGm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095EF1DFC8
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 11:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705492273; cv=none; b=LxhnIME9t0YNqjMIKHYAJ330duvetAUXuqbfdxPBk/1FcZlRBtqTN3A5jtyzde2RAKkBk0OkSohLGGEVrVj4JIVoa0Hzxrr1AhyD9q3DtGJCAaofHL38jxCU1bZzzRL05V1Jiu/OGg7V+24hHWVvh7R/VUmOHfRebmQ6B5/S7Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705492273; c=relaxed/simple;
	bh=OPtTkiouAlCWqpcLmAgIIYVnBKLZUCesR+RlDZ2ERHA=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=hC7AGbdlqUbDUpn7Q8dJ4QNYpUzQKV96M6VYyVhhFisgIPtZe4IodQ3ZC2dHCNyfpX4C2Sg5ze3ZgUoYlW4byiO7y1P9Fp9/AE+BHY1C/EyBRDWyMhMxTrNvSZMfqPR7gWnhs1G7T38lrC+1gfpxjot4O3Lim9VpEHKJvf2IpUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JpoLOPGm; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6dc36e501e1so8081123a34.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 03:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705492270; x=1706097070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXdybsjFtwqNXBEWu9TqcaPjVsWwWYgbT9rFiwsm5no=;
        b=JpoLOPGm4m5YCEANyVIzDcTDaDRQMbzQgUed+lnaAdUWKOQy+FQXnBp2ucAuzYcEVs
         3IdL3hrZbq/iOhDihEqZPSNkfF5XmCEoDoqBtO7mBDFW3WWW3s7GFdDUJFdMiWdy/p/q
         vmALUNaZZXWr/ykYp1725OShu+XaHEyu36u7MusUcVvVirE9WxNVes1g7Zyl45EYqSsC
         Wq/RWfhUhQlCI2vkhp4v48FEJW2PtabX66mwkipDy5iTee4gdwQyc70UMrFxI9Jw0kV1
         9nS0x/cDHbpSai1lHjsZrr4Zq7xsEKbyhZClzRLNOfXsO1edT85zfEawRkUnExMFRNQs
         cIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705492270; x=1706097070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXdybsjFtwqNXBEWu9TqcaPjVsWwWYgbT9rFiwsm5no=;
        b=Rif9LvFsEh5Wg3I/uRN0GIypOraKJib6IXA3Zz6c8xiMdAkDqR8Q90E/TsYJTgetsM
         jVr6PWM2A2ygYxfBgOgRSJDX00hgDMJRhBYTverO7+eE02mRjaiZzexE7lc3/EG+ACYL
         Rev0NM73mHKuTR/euJZKACA35LGmE+cMa+OOlWTaLqd1sgtqpFil8em2WEDtYyAJaNZN
         wHOyNbrhNlTRQHWFrfDhbCZ9uszztQ7SVWaUWUCxa1fDd8jGvFIeEhRifhjS/8L6CWJG
         gFzWAeoW+n/HWK9wZIDELSV8s3PLzvUDjvy/VXmcCOdExNtWuFI6s+EJMDIn4zb1XKqk
         qyPQ==
X-Gm-Message-State: AOJu0YzmQmo1P9N6T6MY2FQMIo8rJeAaDOsD9i1t/HFLjqky11sqSOb9
	PKnNC5O6b9dFi2NNGS5Tr+Q3/UmtntmDVD3ANV/BbyRrx1+2BexEsJBLMsDAxycbuc8=
X-Google-Smtp-Source: AGHT+IG/wDBOkxzJko6OLem/YlrNqdTvdNAUOWJmyU8KZmoB2Kfzv7UhyXfsUX+9Ig0/FfWRcwDnrySmQxh0yZQpmsw=
X-Received: by 2002:a05:6359:4293:b0:175:c21c:87c4 with SMTP id
 kp19-20020a056359429300b00175c21c87c4mr9260102rwb.53.1705492269980; Wed, 17
 Jan 2024 03:51:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117113806.2584341-1-badhri@google.com>
In-Reply-To: <20240117113806.2584341-1-badhri@google.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Wed, 17 Jan 2024 03:50:33 -0800
Message-ID: <CAPTae5Kt8_sb4as4mwP8vNQJXPFxECdfwkNVY=FW4Sc1Fnf_jg@mail.gmail.com>
Subject: Re: [PATCH v1] Revert "usb: typec: tcpm: fix cc role at port reset"
To: gregkh@linuxfoundation.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com
Cc: kyletso@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdbabiera@google.com, amitsd@google.com, 
	stable@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Please ignore this patch as I sent a V2 which fixes the commit message.

Thanks,
Badhri


On Wed, Jan 17, 2024 at 3:38=E2=80=AFAM Badhri Jagan Sridharan
<badhri@google.com> wrote:
>
> This reverts commit 1e35f074399dece73d5df11847d4a0d7a6f49434.
>
> Given that ERROR_RECOVERY calls into PORT_RESET for Hi-Zing
> the CC pins, setting CC pins to default state during PORT_RESET
> breaks error recovery.
>
> 4.5.2.2.2.1 ErrorRecovery State Requirements
> The port shall not drive VBUS or VCONN, and shall present a
> high-impedance to ground (above zOPEN) on its CC1 and CC2 pins.
>
> Hi-Zing the CC pins is the inteded behavior for PORT_RESET.
> CC pins are set to default state after tErrorRecovery in
> PORT_RESET_WAIT_OFF.
>
> 4.5.2.2.2.2 Exiting From ErrorRecovery State
> A Sink shall transition to Unattached.SNK after tErrorRecovery.
> A Source shall transition to Unattached.SRC after tErrorRecovery.
>
> Cc: stable@kernel.org
> Fixes: 1e35f074399d ("usb: typec: tcpm: fix cc role at port reset")
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 5945e3a2b0f7..9d410718eaf4 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4876,8 +4876,7 @@ static void run_state_machine(struct tcpm_port *por=
t)
>                 break;
>         case PORT_RESET:
>                 tcpm_reset_port(port);
> -               tcpm_set_cc(port, tcpm_default_state(port) =3D=3D SNK_UNA=
TTACHED ?
> -                           TYPEC_CC_RD : tcpm_rp_cc(port));
> +               tcpm_set_cc(port, TYPEC_CC_OPEN);
>                 tcpm_set_state(port, PORT_RESET_WAIT_OFF,
>                                PD_T_ERROR_RECOVERY);
>                 break;
>
> base-commit: 933bb7b878ddd0f8c094db45551a7daddf806e00
> --
> 2.43.0.429.g432eaa2c6b-goog
>

