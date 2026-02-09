Return-Path: <linux-usb+bounces-33204-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DbkLbf4iWn5FAAAu9opvQ
	(envelope-from <linux-usb+bounces-33204-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 16:09:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C842111A2E
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 16:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACB78303098F
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 15:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281ED21CA0D;
	Mon,  9 Feb 2026 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="2Mvy2Xea"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B992116F6
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649610; cv=pass; b=La7KxR0KoGY1PydKEErh73T7XetykkLh8aexwT8KRurIN7+fYXwbWTyremk8RqkHdkoxoMus8kdOuIg4/MAbUmfqwqQZqiCe3R4rIQo58EIAhg2mhKlEIbhC1uVqv3KY8EmYqymVRswNZvVofCuRon8oaAmiApAuUEhkkDQVlM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649610; c=relaxed/simple;
	bh=UdL09eWsWMrpntvQzUbH4Yu7IJcQwQCVNbjrIiN9/k8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8p+Ky9U3VTHiyWdI3xHpwRFkRpCepHcAu7LdEU4tLCb1vc7BwfuYzW/0PKem//ajaO4zCAcIns4kiM5CrlvgAJtBgv6Hw3vVq+oMzAprSs5nRH2TOYNXdFC5D2PoAUvw/guQ+0c+uC5zdLzNsyhT5zv3cnXcVcbKhS3p6dAxqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=2Mvy2Xea; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d19bfe1190so3615324a34.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 07:06:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770649609; cv=none;
        d=google.com; s=arc-20240605;
        b=bhIpahetvotUVETvo1W9sjrTgTcp2bW79t+6p1SS4OuNugxdfePDivQP781E9U2KW1
         L5Ecn9vuUqAVHf6aXAbToQ+OQZHss40CZP+ocBFVrE/UcHY9SN8eSLwvrsJcopiHetNW
         Ugm6uVQTuLjwkV22hAB+f92CGvOGiXNXfsjZia2CusiTosgXRicbCcLFSj6eTDDvXYI/
         F3mizRsgKiMh5MWlfaWiiO4Z5mAGx6enuaQfNWCJo6tjIAj8AGxp466dLkoOlWAQVrXM
         6Q1n5C5rNzw+un9uVp+MZy01mPunV2hWU8yKx58MiNYkzR5z8XBzIMp37SG5TXlrC+8c
         AxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0FGeX1KhplsagQcsKdQ49IHMzNXbyrjA1mVXMQs81Wo=;
        fh=LD8gLbtpUYFhaaBgQFuD1Oy6v3WhBLX34anyUt7ztJ4=;
        b=G/QSYUx23bTaZthFFJBnSmleyl37MbsTXD2+2C63LvmyenFK5DtHuo24vxQPAifBYF
         06C06Qtxr4uO9hYhCFNYnAq1wOWSbEh2uW6RATChKVW6jogZmHgNwiv1OErIPXlBeA1c
         Svr5XCDit0S/j/9e5akUrwpMHdXFg4rEkiV2Vg8s6pw9Wh4dpzflhsFTT3I0icgIkuMM
         c94SkRi4SogZwN3A/QgWMgac5An1+gPTKzoZhEEKPodTiqJtFFplPy+IKjnKMR00kgAV
         xNPLAtmby3zTe4KEnHgpZlw7T0VZW6BLpPIBx5+Dvcdd5pCtkJjqGYOEuHcCeHgF9cJA
         MWww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770649609; x=1771254409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FGeX1KhplsagQcsKdQ49IHMzNXbyrjA1mVXMQs81Wo=;
        b=2Mvy2Xeai117MSszFuu766fwNa4UmPo5Lrq+UGDqLhBRpm0Thtq89TGY7d2Hy6wheN
         M158JjjQUKvqk4FopAORufeoP7pOzNL6D9VCEKhxqcTQXxaSL8CyIKjQJR5yMk+MgoKA
         ElTiQABe+qWS3hZoOQ2Rh0umE2rSHB7cczZcBFhhGQOMcwqitRCDkQyucoVsHo+5TiQG
         X+l+eNUrV5zgtBBQ1GWvzl4asKK0hnu+kFokhA32l/T40g8pHAAqEn5/fR9lbzP9D6an
         hPFFQPgAmwDKgA2F/rBWKzFVDAV5CWFNela5q1XyVuChWdpIzRvCZ5Coy6Foe+prEKOx
         3a1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770649609; x=1771254409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0FGeX1KhplsagQcsKdQ49IHMzNXbyrjA1mVXMQs81Wo=;
        b=YJR25MOs4XxCE+K68unJJ+I5FH+8QYbRFPxAh4HqHTcUsIoaT8RlmpWx/o5KkRoPIz
         yxdCIOJYZs3v0VIguahZqTBMcSQ91kkAALvN4qz1yqSqqdZ6X+3boxZOmZmflls/XU6c
         dJnyqGLa8lLXZanuoYjwM20TDnSfvosUNcXLFOSPrtpiapuOsXEiPdwP//YtQ08QjffZ
         aUkzPO/YECAR1dYxY1vD5J0YAP7mcVgunajnD77Q6BemCrVOwgGYtDwy7B9UlDlNDXiB
         NNUyaeHwGD8chl54+j2I/pAvFR9oNwlGsHAKDgdLdKZQhZlacMgmKIBXwMNuzeN+jfUl
         V0Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVGAKm8MXcd/54P0jjgjWy4xEkFOGvTJGb1mh392xq/8J6RU161TESsNjkjawh/OhkJ31tmHN/eFOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMIDPLpixb8lZXFiIntLuDQq+UlM9VHL7+IIzio+4OXTXt9ucI
	3JAju8E7BUYvk5OK76fp5DiXuATcqjNpPiS2psjNyA7I+6t/dtD0uJbIhNZXTWE4ZTdz6/5shqL
	9/nvsvebvgt8FXw/TXbDAzDwQmqXkRKulYGEk9yym1p1sY3upS7H0QfQ=
X-Gm-Gg: AZuq6aICwS9QEI9Iznx/2WO6tVeg/LPnBw+7q6T5nKLAF9WbFkORPwxPli7/sr88SQV
	thtY7laI2Bve7eMfuc3LpXkdbjqw4u4Qb5tBpka+KjlfTLkFtEKUnHxn6BhjRCIf+zIdY8OFV3+
	1K8aS1wQv7dIH2+HOIm9kQy72epq09Djd7CgRpLCrZsjKyzRNw1ZIviOHFc3kOxUGWm6q9ypQ4b
	SM2+RMNQUh6g2FYY8zHRiRxjRjZYTvxCTMNP3YKHZYWkul4MeaDYm/X2QJnRyipTViIGQQG71LF
	glm8W4l1ypd9h3K5/t/Ax017rlS9qzwso6KFrDknBifrrba4+TioBicdPA==
X-Received: by 2002:a05:6830:638a:b0:7c6:d0b2:8eb6 with SMTP id
 46e09a7af769-7d464411072mr6906027a34.15.1770649609293; Mon, 09 Feb 2026
 07:06:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209060113.1731338-1-n7l8m4@u.northwestern.edu> <63677ac4-76ba-4ed4-87cc-b2d3171f26cc@rowland.harvard.edu>
In-Reply-To: <63677ac4-76ba-4ed4-87cc-b2d3171f26cc@rowland.harvard.edu>
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
Date: Mon, 9 Feb 2026 09:06:38 -0600
X-Gm-Features: AZwV_QgHhoJvMtosL4zUQee6jJ3jcfdMwy2PIj_p6WPlDI74nIfBA9P_ys5EAD0
Message-ID: <CAMFT1=aG5edH-B2kdEkZRVg2gCBn1-_pPu-28TykcSjhBzcz_g@mail.gmail.com>
Subject: Re: [PATCH] usb: image: mdc800: kill download URB on timeout
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[harvard.edu:email,u-northwestern-edu.20230601.gappssmtp.com:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33204-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+]
X-Rspamd-Queue-Id: 1C842111A2E
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 8:44=E2=80=AFAM Alan Stern <stern@rowland.harvard.ed=
u> wrote:
>
> This code is not correct because it doesn't check to see whether the URB
> completed normally or timed out.  The usb_kill_urb() call should not be
> issued if the URB completed normally.
>
> Also, the code should not access mdc800->download_urb->status until
> after the URB completes.  The code should be structured like this:
>
>                         retval =3D wait_event_timeout(mdc800->download_wa=
it,
>                                     mdc800->downloaded,
>                                     msecs_to_jiffies(TO_DOWNLOAD_GET_READ=
Y));
>                         if (!retval)
>                                 usb_kill_urb(mdc800->download_urb);
>                         mdc800->downloaded =3D 0;
>                         if (mdc800->download_urb->status !=3D 0) {
>                                 ...
>
> Alan Stern

Hi Alan,

Thanks for your time and review, I'll revise the code and send a v2
version patch.

