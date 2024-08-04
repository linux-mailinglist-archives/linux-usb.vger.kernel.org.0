Return-Path: <linux-usb+bounces-12933-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF640946FEB
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 19:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CD4D1F2144A
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 17:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16226BFA5;
	Sun,  4 Aug 2024 17:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0D4wKAgy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76D32AC29
	for <linux-usb@vger.kernel.org>; Sun,  4 Aug 2024 17:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722790922; cv=none; b=MU35QLQaUYDJ8VqhUK3dvPC72Q/Z3uCBzRE8jPH6/VdkWNDfukTnNjNeTBWNttRmQ7xaWuDj3SEB/0Wd1Rci9MODaE47JC29n0Jj6KmA7rRInpi5kIgW2C7hSZyax4iRJhgVS8v31hW/uvdptWnRLFtXViyupi+H4j9iicDUEOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722790922; c=relaxed/simple;
	bh=kpQlaEdhAW7vK2ragtpelAvJnomK5FZAbYvv0t68cZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMUkHaDXDnyYaYxTsRwlkkm2vw+peDFbrM25HHo56ssLlyf5BbZskv12Y2uF3DSaplK+Z247H1b1R9S3N+qAEPxBBaBKd/fecPUKmq7q49Mw1sLom7vUbq4AfKiPLivrpd9xO72uf73LdBFz+U5X7QC6XJ0BgHlXr+f3hK+09+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0D4wKAgy; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2cd2f89825fso6631659a91.1
        for <linux-usb@vger.kernel.org>; Sun, 04 Aug 2024 10:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722790920; x=1723395720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pyg7jDsFcnKSN08nIcoqB8ycLlfubfs0gLDzgt2d1jE=;
        b=0D4wKAgy0GCGlYj/u1hbpP/FQ+wttWaKuASqGNjG5Psa+2TnATrzmgbzCdDoqp7kpZ
         6vkFUs0mffuwMTEPr0L5CjvixiSnGoXuVRKh/sB3BB7XhrWbUeSmvQnsFNTBpFnoZngV
         4PoF/ZM8AsNcMdODXNf20cHvUWrSXOCFxhETuhUo7hWk4WF98xJ1XpjwZYaGZXwH577/
         5dtmSpC/p5LsiXxNTfdlDYoMX0oUHzXx0pF1gGutpbCVUQiIN5GA2PFBZMOowhl4wEg/
         TgLn/sDrYq2EpuoPQjvPwk//42KSpIr4sprQnKRJN8XHG84bLxHoRP48PSwj7xMBsot9
         e2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722790920; x=1723395720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pyg7jDsFcnKSN08nIcoqB8ycLlfubfs0gLDzgt2d1jE=;
        b=H23zfNIoWWT8yiOkuxqs5n+RlXj1WpL7KmErPkLrH3FcxlZBVjfPEofsDBCqN8wPul
         NrZU5XTXy9QJs5j7W8HeC/IFyGYuwdbwu2LA+tzuAqajk+WXsDkmkPIhNeujcXbKcoVe
         dZHiwipmHbnXhK3Uwbgr5+V7uHjbsZyji1tO4UJiAMcnVBaJQR5n/s28HWpgcHWyQQdY
         z/LxAffjAGu14eQEjX2BrAMOkXHTiD2wC3sVPGyaXQbat83eReW5DZJq13uZF899J4/k
         9fTNlDnKXa1LUJHhKPIl5Rbwcoq80t0Hb2gcCA7nhBgCUDbsHAGqtzMSWFhKrcDGYRIb
         aIvg==
X-Forwarded-Encrypted: i=1; AJvYcCU02YFOYkNj9YTUt8F1VMRLVkSNh/beiEOgrTpFL5/jGl4OJqEvq9hPE4TOGicWubygvFFoyE2m+G8NMOTliQ28dd43q4V/G4+S
X-Gm-Message-State: AOJu0YzzteYoyyPMF5RMPFQ8m+MuGL3HFaLMNJNJfEgsxdFTpwWKCOda
	vOIqzkBc1l2kY1RbSilFaMovIJBH+MsgyPKQLS7UlxJnWstKhFECcekGUmqoTU6tsDOMnttIVdF
	0WkB7UIIRH5WDh5R0F8Qt8W63NSN5Bty27Psh
X-Google-Smtp-Source: AGHT+IG2LqNbcRbg55j/WaygkTsf3QKobNF91cU62zTQA4AWUL9aEIDR4n3Ue6ihWo4DJ9n0K7R2IwfrdFEzsMhFxC4=
X-Received: by 2002:a17:90a:714b:b0:2c9:74f2:3b24 with SMTP id
 98e67ed59e1d1-2cff94142f7mr8483195a91.12.1722790919752; Sun, 04 Aug 2024
 10:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802064156.1846768-1-xu.yang_2@nxp.com> <qo452qwsquqfumcsvlczotdjvyqu2y6itufglldxrlxjv3ganm@6rvhfye7mobv>
In-Reply-To: <qo452qwsquqfumcsvlczotdjvyqu2y6itufglldxrlxjv3ganm@6rvhfye7mobv>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Sun, 4 Aug 2024 10:01:22 -0700
Message-ID: <CAPTae5LAwsVugb0dxuKLHFqncjeZeJ785nkY4Jfd+M-tCjHSnQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: avoid sink goto SNK_UNATTACHED state if
 not received source capability message
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, rdbabiera@google.com, linux@roeck-us.net, 
	kyletso@google.com, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2024 at 8:43=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Fri, Aug 02, 2024 at 02:41:56PM GMT, Xu Yang wrote:
> > Since commit (122968f8dda8 usb: typec: tcpm: avoid resets for missing
> > source capability messages), state will change from SNK_WAIT_CAPABILITI=
ES
> > to SNK_WAIT_CAPABILITIES_TIMEOUT. We need to change SNK_WAIT_CAPABILITI=
ES
> > -> SNK_READY path to SNK_WAIT_CAPABILITIES_TIMEOUT -> SNK_READY
> > accordingly. Otherwise, the sink port will never change to SNK_READY st=
ate
> > if the source does't have PD capability.
> >
> > [  503.547183] pending state change SNK_WAIT_CAPABILITIES -> SNK_WAIT_C=
APABILITIES_TIMEOUT @ 310 ms [rev3 NONE_AMS]
> > [  503.857239] state change SNK_WAIT_CAPABILITIES -> SNK_WAIT_CAPABILIT=
IES_TIMEOUT [delayed 310 ms]
> > [  503.857254] PD TX, header: 0x87
> > [  503.862440] PD TX complete, status: 2
> > [  503.862484] state change SNK_WAIT_CAPABILITIES_TIMEOUT -> SNK_UNATTA=
CHED [rev3 NONE_AMS]
> >
> > Fixes: 122968f8dda8 ("usb: typec: tcpm: avoid resets for missing source=
 capability messages")

This patch looks OK. However, the original patch 122968f8dda8 might be
regressing compliance
(https://www.usb.org/document-library/usb-power-delivery-compliance-test-sp=
ecification-0)
behavior.
Will send a follow up patch if we notice any.

> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

>
> -- Sebastian
>
> >  drivers/usb/typec/tcpm/tcpm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index 26f9006e95e1..cce39818e99a 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -4515,7 +4515,7 @@ static inline enum tcpm_state hard_reset_state(st=
ruct tcpm_port *port)
> >               return ERROR_RECOVERY;
> >       if (port->pwr_role =3D=3D TYPEC_SOURCE)
> >               return SRC_UNATTACHED;
> > -     if (port->state =3D=3D SNK_WAIT_CAPABILITIES)
> > +     if (port->state =3D=3D SNK_WAIT_CAPABILITIES_TIMEOUT)
> >               return SNK_READY;
> >       return SNK_UNATTACHED;
> >  }
> > --
> > 2.34.1
> >

