Return-Path: <linux-usb+bounces-38149-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBBHEY86GWpVtAgAu9opvQ
	(envelope-from <linux-usb+bounces-38149-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 09:04:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAADB5FE480
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 09:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 898FE315C317
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 06:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F99C3ACA4D;
	Fri, 29 May 2026 06:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mx5LpPnY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A6A3876BB
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 06:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780037942; cv=pass; b=ZuWBM5oqcRjpjIQKWI9ZauhLdGv/Y0gM/FxXZjPhYs7Gdsrjm03t2LR1H4qiH6bIelFVpsAf2uy6oFGJiZeXN7xPtPuNj5t8fJEvTk8UWL58u7ZPg/7EcSlKhGelcaacjOePTcdGAk4WL5QY9epMzuZVODLyouaYILBxvp/3e9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780037942; c=relaxed/simple;
	bh=qDVKfDpU84nkZJ3fI8EYnaeHwkvgnJCxNryp3RBgdiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxuAeOdzzGfrHVk+hnpnTMgLlxpT3vsyMd3R9ZobeETXy+G4P3vhPaOPB7EF2bs2cJR/QiITv6tc1ZVTviFJnAD15Viso5EUGgJAW2eP6LmVAIcluZSTBBnQ1ESseFFFF1mDKbXYQjxVdo2Nea0ELMQlJel8Uu9uNp+TozA1LFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mx5LpPnY; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-654672a6d68so13106894d50.0
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 23:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780037941; cv=none;
        d=google.com; s=arc-20240605;
        b=dFcggi5EtZhB9R4zlKuC14AfAar3vkagQbhxBorWzDUkvi8q6A63oqyQLi/qdquarX
         a5fFAGRj5KNzkylN+8ByCP0jALSa4AHaV9MpIGD63ysp+lBxqx3Dw/VWc8XK3AVp4edL
         VWCKhQxISYjSAhyYOKmvBMlBy+Dtn/3DJgELncD2KPw/THYf0Mp5SVyG9Le0Vse/DOeq
         wdZ3OKUD5W78XXyBvQ0v5AnxFCIFvWTudCUXMQwXcXJCjQ1T6nh5KxI20HyQWMGtara6
         e6489LaNKpC32gWDOa67gl+vWs0vXLeMHRHnFZimb1f8mss3rFipJ+uz1iHqp3JKfXhi
         UWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=40sPNPQSTeUFY0i3W6wvVufivHY6nU/kwBNcUQ0dVtY=;
        fh=Wc9S1bBeymbr+rDqbdMGb0gXj2oK/ud1sLSCKDG7dcw=;
        b=LaAnQojYvwktqxgCjYE/mwPQ9IkRqRwMkfTLq/zBdwdwzqIi25z+rcGW5MAnto7WjU
         JRBYQcmJnjqpYYaZ1ybXXXvGviwffmBuIAWQj16f+FZKyViQnWsEjPFpInmWDC3VQ8a3
         UgafIopzTcveNMSx+INGWBI6d1bNGSkf+mGzjBEjeVFcmftsIwuAOF3DL9lwYpGMoO1g
         1GzPxAth8ufTIuOLnebENxRrrvklbUNkYmexQKHlSkLh4aex2mhWu6bNQvDPvEnU6dUO
         IXG+qteq4Lc9s2XMNahmeLvcwzKYfRm1IcfMSc4XvKJowMyIBzEjsumeFbsll4NOdThf
         hEQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780037941; x=1780642741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40sPNPQSTeUFY0i3W6wvVufivHY6nU/kwBNcUQ0dVtY=;
        b=Mx5LpPnYt5XWmnEuiZJaRp/27nOONNS4T2Rz3nevHE38R8fEFYWuZB1lhp8icc6iVH
         YQxapBjKSmd487tvUrw0Fcbuw5bUNEjJ1/ZK0x7krW4+RiUn4D4e0le+hXd1z2jfsRtZ
         jEj3qHbRD75NT5SWl5gF5Qd9Dqe81o10qaTti6gCeRG2Sbc8W/i1SGZCNRjBsH065KrP
         kLn67FkhD+4Nq4srpiG/s16SxN+J9vWfVlS6M4fEgQdsh9TaB83BhTXFNmad5IRxFziM
         OXWGOkmpWeIzPtjkw38TywTJ5N4NcBCrCcG+p9fT2765zcaLHwzOErLtrc1lnCSZ0gZl
         Czbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780037941; x=1780642741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=40sPNPQSTeUFY0i3W6wvVufivHY6nU/kwBNcUQ0dVtY=;
        b=aTRescidXvltys4KzeKDOep3pJxxzL39jSOUfRnALLrsJIEJP/4hRLLumFjDbaOzf4
         QqIUvv8w07h5abRYOBk1agh8ax48WSbnn5Mrj0HRZMb7b75UEq96cf0GlVuQmZ++rM19
         +UpwPO8e0wp2cHPQITtMBuyukN8atFs8WVzITGQDxOj32oPkvdAHD4+AsOJsNU1x63Si
         Ez47DdBz6jyUPrxJwpsEZiCJqRnpRTc5JPvHj/JdS6yZk3qupkyd9qyj+vpNsIsJZ3c0
         27arjoFPBV1nWvu3ytsp7nt0hHZY7qj+qFxGNmA/wIUWtvnG+ddeesMkh+g+eSfTHCh9
         TfOg==
X-Forwarded-Encrypted: i=1; AFNElJ88BGfEdowwNJvqDLXmZhvxizzNw1RBZWDPTFILwxjPCIOON2Wj9MD7HFk+Q/X/Y9/ys9pIJjY73KU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyemaj8PLwSc9bby7/h0DJqw6FECDiSgpmN2tvZLTl8us9lZvvq
	MlZ9w9QW3+IKiQzE7E8sd2ZT+CcHvdMbcQUMJCU8WECVD65vSY5Uc/qF3tVhDxibrxQM+W3VSst
	Yw8/t5LnY2Fi40lMaXRDeHnTcSfpATj9uBJTr8yI=
X-Gm-Gg: Acq92OGoAnOLJo7AMSGeHSYCzW23oYQBUgFxVtql5jJRrBd5b724NnHI/0oerBxhJPb
	wwvZ0mO16/DQkEtXWYZtevp8NfmJKQOyX6wdXc+6IPe59V+nV+/IX4m6fsPy48ynKDXSCON+eHH
	ytWRz5LyCELgfiSa6zeW+B7tdz/65mJ1u71pkWTKLLp3fVv5xgjw6K9QE6/Ax8OR1H06ZUg/q8B
	WOn8Daj13gpEoUc4mxx0LIRKgAWbW4oVJmqroeJobLUrQPeCxG4u1OsKoGUS8qbSxsrQh8c+rox
	2pnuq6WcKvSKpzUyviE=
X-Received: by 2002:a05:690e:4184:b0:651:cb6e:7cc0 with SMTP id
 956f58d0204a3-66052df2275mr778864d50.26.1780037940669; Thu, 28 May 2026
 23:59:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528082751.204898-1-ginger.jzllee@gmail.com> <5099d6cc-c8bc-4fdc-97cf-31e96a57e0c1@suse.com>
In-Reply-To: <5099d6cc-c8bc-4fdc-97cf-31e96a57e0c1@suse.com>
From: Ginger <ginger.jzllee@gmail.com>
Date: Fri, 29 May 2026 14:58:48 +0800
X-Gm-Features: AVHnY4Kt9EjDuNi4RnKG7Dem6lUgwHOPUh1l67eZ5WweFEVFVKJRdsoxivE9yxA
Message-ID: <CAGp+u1ZoHA52vPL5msC29BM5g3xT9c8-A20tAs2LHStnuwMmbQ@mail.gmail.com>
Subject: Re: [PATCH] usb: misc: yurex: fix ordering of usb_deregister_dev()
 and usb_set_intfdata()
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38149-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gingerjzllee@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BAADB5FE480
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 5:56=E2=80=AFPM Oliver Neukum <oneukum@suse.com> wr=
ote:
>
>
>
> On 28.05.26 10:27, Junzhe Li wrote:
> > In yurex_disconnect(), usb_set_intfdata(interface, NULL) was called
> > before usb_deregister_dev(interface, &yurex_class).
> > This opens a race window with usb_open() in the USB core:
> >
> >    T0 (yurex_disconnect)               T1 (usb_open)
> >    --------------------------           -------------------------
> >    usb_set_intfdata(iface, NULL) [t0]
> >                                         fops =3D usb_minors[minor]  [t1=
]
> >                                         /* fops still valid here */
> >    usb_deregister_dev()
> >      usb_minors[minor] =3D NULL   [t2]
> >                                         file->f_op->open(inode, file)
> >                                           yurex_open()
> >                                             dev =3D usb_get_intfdata() =
[t3]
> >                                             /* dev is NULL! */
>
> Yes, but yurex_open() checks for dev =3D=3D NULL
> Could you please elaborate?
>
>         Regards
>                 Oliver
>

Hi Oliver,

Thanks for pointing that out. IMHO, the check for 'dev =3D=3D NULL' does
not nullify this bug. The potential race window with the null value
check is elaborated below:

  T0 (yurex_disconnect)               T1 (usb_open)
  --------------------------           -------------------------
                                       fops =3D usb_minors[minor]  [t0]
                                       /* fops still valid here */

                                       file->f_op->open(inode, file)
                                         yurex_open()
                                           dev =3D usb_get_intfdata() [t1]
                                           if (!dev)
                                            return -ENODEV;
  usb_set_intfdata(iface, NULL) [t2]
                                           kref_get(&dev->kref); [t3]
                                           /* dev is NULL! */
  usb_deregister_dev()
    usb_minors[minor] =3D NULL   [t4]
    /* The global usb_minors is nullified here */

I think the intuition is that the global exposure (i.e., the
'usb_minors') of usb fops should be disabled first, so that the
subsequent nullification of internal fields can be considered local to
prevent concurrent accesses.

Please correct me if I understand incorrectly.

Regards,
Junzhe

