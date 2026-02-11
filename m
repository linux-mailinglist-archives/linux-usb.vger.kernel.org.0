Return-Path: <linux-usb+bounces-33268-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EQ2AmD6i2njeAAAu9opvQ
	(envelope-from <linux-usb+bounces-33268-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 04:41:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 761231210B2
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 04:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 121793078A02
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 03:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554593446A9;
	Wed, 11 Feb 2026 03:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical-com.20230601.gappssmtp.com header.i=@canonical-com.20230601.gappssmtp.com header.b="HdOLwEhx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD5534AAF0
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 03:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780772; cv=pass; b=aAzrq+OU75Kl164YRM3kGodGFvLZi0yJLC/vAX1yD6U+9f5Bgsr7y42gX9k4v5dyDpG5zueIzoGR759pp5TfkynIDnf88F349uzvz2kyD6zGkfC+g7jiTg2meXMku8yW4907j7gbwib1bLPYzLQ5xl9n0ZquPaIgNyAjBy8Se+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780772; c=relaxed/simple;
	bh=ND/EJ3Z7yUGBVqhiWuVJtcEV8UgFE1EBbwCVsk6fPA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=QizS4sHEh+ay76hXi6R4CCI5wONfX2oQ7dftrAz0UlNa8613ny0OtOYMixwWEw3sUc8W5TFhXXn/TOluDd233WHUS21r5f1X9u1riCvGJFjYy0n7u7T5E/xQCtNScQQrho9A0UgA5HfqUmfL1JxpHewBfjKrqtZEgkkmzfK9qIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=canonical-com.20230601.gappssmtp.com header.i=@canonical-com.20230601.gappssmtp.com header.b=HdOLwEhx; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59dd263bf42so6480869e87.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 19:32:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770780769; cv=none;
        d=google.com; s=arc-20240605;
        b=Wn8nwr2/5zrJMJ9rk+i+UcohBJVQptV+pOq4hO1dX/VL8peAQCMboOqCL1dYPWM+LB
         9HOlEAogwL4pTZ52TLST6vfzt0zFt59Co8f4vMK13S7gaWj5fLEFDnsceMLy4HokRuft
         scGPrLQZV2n7vBb0WskR2v9L+onea+K0gsZS3vrT0vWQ0VWJWBZhJPfmMO++vNfZpkQe
         jVUFXVD6vLQZNxW4wRCLUPprNu0xB7C7RUgXP+JsqfS1OLyBAyH83XI97uzXvKHEjr8I
         NA4Dj3dHM69p/0UJcvbBgWXb7O+07HUTL35g/lmXAOt/27ZAjeiPnFhltnSr60aHqJ5c
         Swcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8B19gmpelZoCYIJv86yDPhQxqApNJ2FIKydWpHJgFFY=;
        fh=Y6J2JEvz2gQVfQgLO6QBW5zCYWM1fGNcG2H9BW79fcY=;
        b=e1CpkZ1EgJMP/Yej2mLRt7pD0GYZkv6SQPNo6XIYlHmemtJR5WBMqHCrwZKz5Z5TJA
         WT9l/NAt52LXkDodCWM3NaGJjmXXCT4jSn2DRCUnfP9+i/bDunWr6aBtNAdbYqQmw6k2
         b7ZLOzoW+uxJFHPR9At4bJZ1b3prgCyzAdpND8fPfVEKf9nldz6NUT1aK3eUVoMkJ896
         Yaf51tynxaqLjEg3Ki31D8eJfZxC5JuViph+gkasSumTGqB6jElClU1fQGn9QC8fYhyQ
         PcqM5bBDLJGBqMWlLBlsBzorKXPkjPxsUYu8UWsvk7FWWlwX8TojlAgqsySD9tvB5I7T
         oTmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=canonical-com.20230601.gappssmtp.com; s=20230601; t=1770780769; x=1771385569; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8B19gmpelZoCYIJv86yDPhQxqApNJ2FIKydWpHJgFFY=;
        b=HdOLwEhxTr39HeaiAqTQZHqXmWXjUwEQSJzEqvRTAdx2DfRXeZQ5iZGgGx+krlCtcj
         fivdruVjp7EW2Dsd0h6Zpj+uN2Ir6tUKiHBcIONyhwcLOSp2U2paLUPvAGtCNo5aTBcN
         T3D5QFee84mK0+Ze8RGbd0C8yWBQaRgsM1crCneAVjtGyBE5nb7IT6f7ouPjtXDwXz+A
         pL4Yd/7mUMQ7hwo5p3cTUU/FAiI6+kr+z50kVhUZ5lMM7TS6kEcLaiEu+3ouzOeJRB5d
         pkOffnr/n1+0AJ5yMRcCOpyxupdvwKxhQrh7yVqPNpqaR8aUvho6GPdx9Rg5PRWEc45R
         1nMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780769; x=1771385569;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8B19gmpelZoCYIJv86yDPhQxqApNJ2FIKydWpHJgFFY=;
        b=FQdCGl279TAASV3DwWOfh/kkRCYOEJaF8TqRyYJ6hqsU5xzyYSIxKV4+Oxmo5iNXGB
         1XyKm/JIYNuSYUuveec870f9eSCx88/4bfxn9Qn2u4l7MdgHE9O383Q1TtYi/Ht0iE8k
         XX9a/K+9i5ajnC6e44D3EJCJBpbTBVNC5Q5dsb30Hlw5rluPdr34/NcUIaOEfzuW061E
         vT/kxFlgAmBN6IEt4FMQyMrTuggKTTQh9I+A1tG6groDnKRK916M/DosFgBsdjAgQwpx
         T1Svmq/jGrbAOz7kM/YRoO57piSZYrTBa2fmRDdrM8nUuuG4CZQTa2CIBtzSEsb7wILI
         uncA==
X-Forwarded-Encrypted: i=1; AJvYcCVgddY8MI+zSHbj5yskXzb9H6aWP6wrSWaXEjIXTfjfx0XTDZc8Vpa9W6ciSJUK8vbrFk0whhHkNYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7KRzEhfy1MaDY8aB9V8H23+1lOJhmPa+jtAR2W/yYQ7DcX8L/
	3Vn0CbSvdOPKRFf1Cprz2xMs1zjJI6rCLPZncViIOu9RjgVmwj0ojEg2c88httv1j/M7CeN9/eh
	9cNVSbULbuM6fMq1BC9TBQ5D0W5ViKFQ=
X-Gm-Gg: AZuq6aL8cB9J3SFTnx1ArT+fNIQ4pnNLQXftnaS4uxpeznwHmVRdHZ/cZy9IOVqBgrQ
	ykYYhQzJrcxfpUhQdJfxTuCBmN/NH6oVsO1OKO3zsYCN8xl7usTDXxaq/Fo93WXIda5JAtE9AoA
	rhf2NX3OekVyYVZsU/f0HJnDj54RW012O1d0cFUAp2L5D9HZGHRS490J05EGA9lREzasCJhRd4r
	qvN+S5XO6Dz65nq1cYNirqrTZRWtfcjFnbtIMZDlW4MrQsd7t78OEnGq3yW0yWLrwX5SvHY8co9
	3UlgYYELs/BFgH59ZfY=
X-Received: by 2002:a05:6512:3b0f:b0:59e:5b94:18c7 with SMTP id
 2adb3069b0e04-59e5e2287ddmr208418e87.27.1770780768818; Tue, 10 Feb 2026
 19:32:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224070022.4082182-1-acelan.kao@canonical.com>
In-Reply-To: <20251224070022.4082182-1-acelan.kao@canonical.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Wed, 11 Feb 2026 11:32:37 +0800
X-Gm-Features: AZwV_QhKl2g_VQdNhU0AkYA9hNIbC46rXE2RgLLSdP5Z83ulYd4HWr3xepH9e48
Message-ID: <CAMz9Wg_H0HrDHvnvKbPE7XMtBwCQ=2poeqseNW_RdoOC-DNrDw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Abel Vesa <abel.vesa@linaro.org>, Andrei Kuchynski <akuchynski@chromium.org>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, "Christian A. Ehrhardt" <lk@c--e.de>, Pei Xiao <xiaopei01@kylinos.cn>, 
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[canonical-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,acelan.idv.tw:url,kaoatcanonical.com:url,mail.gmail.com:mid,canonical-com.20230601.gappssmtp.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33268-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[canonical-com.20230601.gappssmtp.com:+]
X-Rspamd-Queue-Id: 761231210B2
X-Rspamd-Action: no action

A gentle ping.
Please help to review these patches, thanks.

Chia-Lin Kao (AceLan) <acelan.kao@canonical.com> =E6=96=BC 2025=E5=B9=B412=
=E6=9C=8824=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:00=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Some firmware implementations incorrectly return the same altmode
> multiple times at different offsets when queried via UCSI_GET_ALTERNATE_M=
ODES.
> This causes sysfs duplicate filename errors and kernel call traces when
> the driver attempts to register the same altmode twice:
>
>   sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0=
.0/partner'
>   typec-thunderbolt port0-partner.1: failed to create symlinks
>   typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt =
failed with error -17
>
> Detect duplicate altmodes by comparing SVID and VDO before registration.
> If a duplicate is detected, skip it and print a single clean warning
> message instead of generating a kernel call trace:
>
>   ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVI=
D 0x8087 (VDO 0x8087a043 vs 0x00000001) at offset 1, ignoring. Please updat=
e your system firmware.
>
> This makes the error handling more user-friendly while still alerting
> users to the firmware bug.
>
> The duplicate detection logic is implemented in a reusable helper
> function ucsi_altmode_is_duplicate() and used in ucsi_register_altmodes()=
.
> The fix applies to all three recipient types: partner (SOP), port (CON),
> and plug (SOP_P) altmodes.
>
> Fixes: a79f16efcd00 ("usb: typec: ucsi: Add support for the partner USB M=
odes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
> v3. 1. move ucsi_altmode_is_duplicate() before ucsi_register_altmodes_nvi=
dia()
>        for later modification on ucsi_register_altmodes_nvidia()
>     2. use struct typec_altmode **altmodes to simplify the logic
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 76 +++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index 9b3df776137a1..b99c86e9f31cb 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -501,6 +501,73 @@ static int ucsi_register_altmode(struct ucsi_connect=
or *con,
>         return ret;
>  }
>
> +/*
> + * Check if an altmode is a duplicate. Some firmware implementations
> + * incorrectly return the same altmode multiple times, causing sysfs err=
ors.
> + * Returns true if the altmode should be skipped.
> + */
> +static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 rec=
ipient,
> +                                     const struct ucsi_altmode *alt_batc=
h, int batch_idx,
> +                                     u16 svid, u32 vdo, int offset)
> +{
> +       struct typec_altmode **altmodes;
> +       const char *recipient_name;
> +       int k;
> +
> +       /* Check for duplicates within the current batch first */
> +       for (k =3D 0; k < batch_idx; k++) {
> +               if (alt_batch[k].svid =3D=3D svid && alt_batch[k].mid =3D=
=3D vdo) {
> +                       dev_warn_once(con->ucsi->dev,
> +                                     "con%d: Firmware bug: duplicate alt=
mode SVID 0x%04x in same response at offset %d, ignoring. Please update you=
r system firmware.\n",
> +                                     con->num, svid, offset);
> +                       return true;
> +               }
> +       }
> +
> +       /* Check for duplicates in already registered altmodes */
> +
> +       switch (recipient) {
> +       case UCSI_RECIPIENT_CON:
> +               altmodes =3D con->port_altmode;
> +               recipient_name =3D "port";
> +               break;
> +       case UCSI_RECIPIENT_SOP:
> +               altmodes =3D con->partner_altmode;
> +               recipient_name =3D "partner";
> +               break;
> +       case UCSI_RECIPIENT_SOP_P:
> +               altmodes =3D con->plug_altmode;
> +               recipient_name =3D "plug";
> +               break;
> +       default:
> +               return false;
> +       }
> +
> +       for (k =3D 0; k < UCSI_MAX_ALTMODES; k++) {
> +               if (!altmodes[k])
> +                       break;
> +
> +               /* Check SVID for all, VDO only for non-SOP */
> +               if (altmodes[k]->svid !=3D svid)
> +                       continue;
> +               if (recipient !=3D UCSI_RECIPIENT_SOP && altmodes[k]->vdo=
 !=3D vdo)
> +                       continue;
> +
> +               if (recipient =3D=3D UCSI_RECIPIENT_SOP) {
> +                       dev_warn(con->ucsi->dev,
> +                                "con%d: Firmware bug: duplicate %s altmo=
de SVID 0x%04x (VDO 0x%08x vs 0x%08x) at offset %d, ignoring. Please update=
 your system firmware.\n",
> +                                con->num, recipient_name, svid, altmodes=
[k]->vdo, vdo, offset);
> +               } else {
> +                       dev_warn_once(con->ucsi->dev,
> +                                     "con%d: Firmware bug: duplicate %s =
altmode SVID 0x%04x at offset %d, ignoring. Please update your system firmw=
are.\n",
> +                                     con->num, recipient_name, svid, off=
set);
> +               }
> +               return true;
> +       }
> +
> +       return false;
> +}
> +
>  static int
>  ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
>  {
> @@ -631,6 +698,15 @@ static int ucsi_register_altmodes(struct ucsi_connec=
tor *con, u8 recipient)
>                         if (!alt[j].svid)
>                                 return 0;
>
> +                       /*
> +                        * Check for duplicates in current batch and alre=
ady
> +                        * registered altmodes. Skip if duplicate found.
> +                        */
> +                       if (ucsi_altmode_is_duplicate(con, recipient, alt=
, j,
> +                                                     alt[j].svid, alt[j]=
.mid,
> +                                                     i - num + j))
> +                               continue;
> +
>                         memset(&desc, 0, sizeof(desc));
>                         desc.vdo =3D alt[j].mid;
>                         desc.svid =3D alt[j].svid;
> --
> 2.43.0
>


--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)

