Return-Path: <linux-usb+bounces-32850-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC7lC5R3eWkSxQEAu9opvQ
	(envelope-from <linux-usb+bounces-32850-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 03:42:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7008B9C5D6
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 03:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB4303011F21
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 02:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2446E2BD5B4;
	Wed, 28 Jan 2026 02:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="miXShknz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DB52857C7
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 02:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567929; cv=pass; b=gHLXZ4G7mR47ltJpad6zjfMZTcTi/ro7djI0ok/yazffFIxHPPMdL4X6o1WJHxhYqNDhi5mW08eKQheQwXHqAEvHZuXzx7suXlbzNDRIaxyjzXQn4T2WBpftHF+8ah0lj8bqs8kZaJ5XRYKMD92+ux4uoMy+dzXumkk0GSuE3k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567929; c=relaxed/simple;
	bh=N5axFKMGN6iUxH/KpssfSq/QEcw40h6Ss3yGO1ZnbN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGyQNGfCJ+R88ExzrWRo0GB9qBdbt/+J8GmkDDq5VhcGr+U3N0l07iA6EmPbMJG161KN9fSEpCnKI2haCWyxG8UgAynwr1KRwrrXaItg7MKvk9FYvUVNuLaGiFyvQGz/fn79acIy+gAOUgxRdlJ3jNaf7Tfd2dOHVUYOl6Yb8ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=miXShknz; arc=pass smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-45f0b597eb4so84342b6e.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 18:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769567927; cv=none;
        d=google.com; s=arc-20240605;
        b=P2GBTXUdqmB9AnWDJ3iMIgw4s0rA8vILSyTmT6ArVv/Tn2P5oPgQxLAotOgolb3MXU
         J/UXYDGPclWARzRwPLqSOnpui9NtQ+JNqEI5cKPEbSUb0TkmZYBlA2GlD1VRmDO52dCe
         9/FIpkK7t4qu7T1kH3WPzxVp5ow4GZBKSosCfwpoDOi1fHhoxKof4l+2L6jjBVWJTfCI
         DeCr8zHa9CfN0vvolLUEAXgQIlZQYA5FI/ZOiF1B4fsHhfKiwo/HqEnJ2eZ+v0+NBAFX
         pDIj62HsLtCZyYX32ivYFfY3JvJyPzGuGQ9faCb3WB88byUvX4A42FBm7afk6zui0bt5
         /BaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FGGKTzz3/BELS8z/wQ2uf2G+LXKeo0w8uAgw9NF6Lec=;
        fh=rYcPAJHy2cM/mqmFJx3yv2WiUP/OK2fNOjA6NpDEcGM=;
        b=h4+QfHfIKE6/yim/FDojhKvyZtwhvrid8kQjqQl/lfgcvXIAP+U6/d7SNdu2FBJ/kL
         qnQhd7Hsu5tsgIhmOFC1WM6DNHfxfL3AOGyam0z/kdxGuHWlMcM4dlfYPeKVd7lmAFfz
         kccCMav8sDzg4nX5mlqfYtyB9py28QFgMKUFeRxjib1HUTMOuMrqP1u1NvA68jebYR62
         8ENoQGIgDwoBOe/hT3dhwz379kFgvzyGaAiZLOKycmX78Aj5fuA3TMJJ9Yy+TNIR80A5
         9FbM4K3XFw9F8pG6VEYZlhA+BjBDytclbGvhXsbnszTmhD264Q8gtxpKyjRaVU1yviyH
         oGnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769567927; x=1770172727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGGKTzz3/BELS8z/wQ2uf2G+LXKeo0w8uAgw9NF6Lec=;
        b=miXShknztGRzeERAbcTKRNLlBHP34h9GFG3utx7mWAvycVYWbQEI0lp1387uQrFnd/
         YpHeY60/17bqZsb1BtFWJvUnCZq/ru/DnfjN4sZf+tdaHDvASBxOkYxeb1nbhIpEYc4j
         w3fj8JXRkdT0xTw8qtxmOxrfydaVOcODz9lNosY/kAlD55m5x/xZ+6yuJ4Ajo2HJ+j3x
         phHjuDCkJQPyGgmFkIGUN9z8aKLnksVbepVrh4JzgHJpGNzJYQBHEFE1A7q3w04ts3B7
         qrTsmNYPt/tUTXSz7bw0E7BkW+mJ7jxV1gPuwtvdm/oPfy0tLEg4Mg0OgPMEPtGqnRHT
         bKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769567927; x=1770172727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FGGKTzz3/BELS8z/wQ2uf2G+LXKeo0w8uAgw9NF6Lec=;
        b=XBGUhNq1JDk2UYf03YgGLi+h2/mOfUuPVBkEhXU0pO4ZmVTUVBF9U212rkUlJyrz89
         KyNOC5zhCjoTHkuKdQ3QOBQgusUQ6JMJ+N8Rkycyh0KIMS7KjJgQFzEGMfGjPktWQbpo
         OhgAMZRBBb81sUzf3aoEw8OYZ1LQ/kurMz0zxvKiyi9idft0P7gZnIYl1g3/Xqou+LKr
         WPAFevUis49Ihj0CbgzXACqGYub33XSeZrHNWybca2hea8oX2NoLQJOcvLYw1gEP1DxQ
         5TLiNTiPUqt/zIQ3MxDcKGfNrj9TygpfdB4Ocwr50Qy/9M0rGxR51sVYCTg1h31+QPIa
         Fybw==
X-Forwarded-Encrypted: i=1; AJvYcCUYWf9n7cybXnDcqFI62Upe4oWK6VSZ7oToJqdkPfCkbuDiO52e4ebe7qfB5f0RykN5r13/FthAH78=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+j7pJga89gcfKxAxvw+xYVs8NwAcm15L3KGksbeJX7EohLM0A
	1vF9uDMbpYs2+zbY8JqRxA/tt4xMMjKPowqsqGfdrpZgMJUYNSghVpkqMbVI/yz34ilSFMNXpcN
	wOBhbhfTs6Qti2k6d4BqtMBiG0Wu6FA0BjAF7AmzQ
X-Gm-Gg: AZuq6aJIoWAm3N90NZTUcx5IcY4DcX5TXe66OKVo/32vKgRGdls+qZ0DyhwKeSfzk8d
	pk+kGobs2ZbXrp3zNDVj1GVH6JJTm6PQ7kzCQv2b27v0X6LZyE3rlvH7rJF4C0qjjNGiLbxTT5v
	uJajHL5y4xFMtCHeOWRgsULTwhpYBd+Abnf/bWG8TfoubzEaDsKzx3tzTFXqA9y71eCf/HN8MR9
	l0vkNzHqNrTTLYLnL6HeMhaStMvMhJ/PoM/GkNfgtAvzR9YediQwKv2I0guWaw9zlR3ScdO8qjY
	EsQggIvT1oAeIEF3GnfoDKac0A==
X-Received: by 2002:a05:6820:198d:b0:662:f763:c532 with SMTP id
 006d021491bc7-662f763c9f0mr1599483eaf.21.1769567926804; Tue, 27 Jan 2026
 18:38:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20191230142611.24921-3-heikki.krogerus@linux.intel.com>
 <20260125035457.354349-1-andyshrk@163.com> <aXd2ogJCAxTjvLDd@kuha> <aXd5jqDUg4cXdX7j@kuha>
In-Reply-To: <aXd5jqDUg4cXdX7j@kuha>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Tue, 27 Jan 2026 18:38:10 -0800
X-Gm-Features: AZwV_QjReBbj0VRAzk7EOupCoX8NEgcE3LFePziHRidRquNmqv_gr-ymkyGXpqY
Message-ID: <CAPTae5KP+B++SEk9+Cu_RZ2Z-pWD1g5vCwdSn+aFB4M4KwcDqw@mail.gmail.com>
Subject: Re: [PATCH 2/15] usb: typec: Add parameter for the VDO to typec_altmode_enter()
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Yan <andyshrk@163.com>, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux@roeck-us.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32850-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[163.com,linuxfoundation.org,vger.kernel.org,roeck-us.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[badhri@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7008B9C5D6
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 6:26=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Andy,
>
> > Sun, Jan 25, 2026 at 11:54:22AM +0800, Andy Yan wrote:
> > > > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm=
/tcpm.c
> > > > index 56fc356bc55c..f3087ef8265c 100644
> > > > --- a/drivers/usb/typec/tcpm/tcpm.c
> > > > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > > > @@ -1475,16 +1475,16 @@ static int tcpm_validate_caps(struct tcpm_p=
ort *port, const u32 *pdo,
> > > >   return 0;
> > > >  }
> > > >
> > > > -static int tcpm_altmode_enter(struct typec_altmode *altmode)
> > > > +static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *=
vdo)
> > > >  {
> > > >   struct tcpm_port *port =3D typec_altmode_get_drvdata(altmode);
> > > >   u32 header;
> > > >
> > > >   mutex_lock(&port->lock);
> > > > - header =3D VDO(altmode->svid, 1, CMD_ENTER_MODE);
> > > > + header =3D VDO(altmode->svid, vdo ? 2 : 1, CMD_ENTER_MODE);
> > > >   header |=3D VDO_OPOS(altmode->mode);
> > >
> > > Sorry to bother you. I happened to come across this piece of code and
> > > I'm not quite clear about this part: vdo ? 2 : 1
> > >
> > > According to the definition of the VDO macro(pd_vdo.h), the type here=
 is
> > > only 1 bit wide, located at bit 15. If the type value is set to 2 her=
e,
> > > wouldn=E2=80=99t that overwrite bit 16?
> >
> > That looks like just an obvious bug to me.

Thanks for reporting the bug !

Yeah looks like the patch un-intentionally set the "vdm type" which
should be always 1 given the structured VDM.
PD_HEADER(type, pwr, data, rev, id, cnt, ext_hdr) already takes care
of the "Number of data objects" through the cnt field.
tcpm_queue_vdm() takes care of setting the right value for port->vdo_count.
So the following shoud likely be suffice to fix the bug.

--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2957,7 +2957,7 @@ static int tcpm_altmode_enter(struct
typec_altmode *altmode, u32 *vdo)
        if (svdm_version < 0)
                return svdm_version;

-       header =3D VDO(altmode->svid, vdo ? 2 : 1, svdm_version, CMD_ENTER_=
MODE);
+       header =3D VDO(altmode->svid, 1, svdm_version, CMD_ENTER_MODE);
        header |=3D VDO_OPOS(altmode->mode);

As Hekki suggested, feel free to upload a patch.

Regards,
Badhri

>
> Whoa, the thread and patch seem to be really old.
>
> Please just prepare the fix. Let's discuss it there if there's
> anything.
>
> thanks,
>
> --
> heikki

