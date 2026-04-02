Return-Path: <linux-usb+bounces-35850-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAXJFx0yzmnIlQYAu9opvQ
	(envelope-from <linux-usb+bounces-35850-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 11:08:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D640F3867DE
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 11:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4378307D7EB
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 09:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D784F332621;
	Thu,  2 Apr 2026 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3/uBPan"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF47632E72F
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 09:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120598; cv=none; b=QNibsHV4F+B3Pg5yavmTDnPab3QT4sqlKBCVHJXGDjnknFTmX5RkkzHZFvwekxzDrJCHwr3Pky+fEzwJy497tsH8vNdRIdXx+eLrJOUJtX4QcVfHiJnfIVsNY74RyF8Q2t/9FhOrYAoJlqpIvPa1kBAeuHn/X/108Sfq/m4gAt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120598; c=relaxed/simple;
	bh=W0apAXOTK9JSsSkLiaJ+8pNqNHE6rVZimL6JrJeO3ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QTPFNBjjDoYU8bgVLzERgQp0TSY5FDr8XHhmBhHEQPjA/8btCr1C4VS403qbyrJ4cmDdJQFu0iq/4VE9Y70wGCbDlHaF5m1Iyp1/xTUs/honUVw2sgcHUHFabSrzIt4DzOfAZHz5dCEdajXxpIaEC0TZneaTd4dF5eHS4tU646s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3/uBPan; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50baf2df711so6529771cf.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 02:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775120595; x=1775725395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H76qre6F2wTwbw92iok4xKfJ+shcvU4/HxAz+muIw2Q=;
        b=N3/uBPan9mYckyTrA/m7HikJE7hYEzWQN/W/bcH0gn7kdTXavMUlfxbOCG5lDmPe83
         WrqIPhkClNF8wzJCLd3kx/OOC/TRPXo8V+4WVBzCPPmYg0iSbc1mXqUuF6LxFZFcMD5d
         e+pVDpsgyRmHqW4k7c+4P+gpDVxTVM7S2OcfO2YblQfY+SLDa1avf+syGAc1LIyXIcUK
         WyiA3AytJKfu7dEKqIA7Gc7WeSGXqJ1v+nv8/BRoaG99RsugDdULn2sZtE3tV+XUO93c
         IQMwU138lYhZCyenl7q+hBcsfO5VwPIZSujx8SuUiMevTP8QAxLR5+Ibn548dgc7rmS+
         CS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120595; x=1775725395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H76qre6F2wTwbw92iok4xKfJ+shcvU4/HxAz+muIw2Q=;
        b=Xv8sD7R4rEluHGfCy7WnQJZl+tv+0pBF3qJnondR0/h39ezjcR2L+mkE5H3S3hkRV7
         tASUXcXgYDm9ZMwj7MX6YbbGDNuSzaNEAPGzsER5pgM00xO+Fl7AqUYTVc3o6nwVGKbx
         6QKszAXTHTFCiCbeX5KS0kwhCZPkRe+FuM0xsDzl58IT6aV1w2dfHGFIhAg9VKg7zJF9
         iA6nnwCHAJpHCe/C1d5rgT4i+a9KhARPp2XZJ/6RvjzaF4103rERq0PoVBq1V7tDgs1G
         5hdCmAfCZSrQ6YHxDIyF7d+7c0PKe+1LG2UlnmBBeZDh7spb0sM+YX5VZ5kIfcyIpyyn
         x3UQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0dElZlRZXmdN3OGf+2GPJdtuLYwPn2d78HBKrM6/kQ+U0Uu8zZKTehRZvCkCSqCAr9QkA0w6cU0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3wjSGqczausX3jGi/WT+Wo06RDrGDRGuTOlFr3QuSbw5K4UEs
	eNpp1AIIJV8W2aIIsFmU8qOCVgOZ3xEdUMnvoVPa/0udMAjSQdLrRRz9
X-Gm-Gg: ATEYQzyeMP6Tn4K6aei+3XgtduIFEVWgZbw7egTjBF9pAFn6vw2T/XKHyChnHbp6Wbs
	qwXqYuoiIO7aDZ8h6F6oU5ZRPLwNlUF/5wFMwpDEfKcdf3Ox8LUjHz4K8TIbUnp/LdcIelvyBCJ
	+a4O+XUlZuog8MMGazl4vSRG8OZ5wvHB2/KR3zXrWZauN5/Nh922oLerzkCEzDu6q5ygQJBAmSG
	iVRLxz9w6liIo1BxgV08MqLDmctwsibjGLlpOuoCZC6E5vHwzNqmK8/jy4Bm4sGK1QFKuOWPHUd
	CYclCFkcBjccBtnOd8J3unvogNbRNX3vVf5hGOO09V3oukg4Au7oOMBx2KtZxiUfkU6o0LyF5Vv
	v7HE7HKm1KiKh5wi1mgiPc9GxTiO38EHgiD0VIf8U1aEuick6oMvYAipXFZZI+VBaFlPFeIo8Ir
	78WR9FpV+MuT8Gr8WLVCk6nY5fXH8jErmu3YY10og0Bw12/8RAgadVemGL+R365FfuK7G0BgfL8
	yjpvtvpvk3y2Sx3qtkr
X-Received: by 2002:a05:622a:428d:b0:50b:3f50:16c with SMTP id d75a77b69052e-50d4b9d273amr38055611cf.15.1775120595312;
        Thu, 02 Apr 2026 02:03:15 -0700 (PDT)
Received: from localhost.localdomain ([129.170.197.116])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b1a739dsm17857511cf.1.2026.04.02.02.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:03:14 -0700 (PDT)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	addcontent08@gmail.com,
	kyungtae.kim@dartmouth.edu,
	stable@vger.kernel.org,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: Re: [PATCH] usbip: vhci: reject RET_SUBMIT with inflated number_of_packets
Date: Thu,  2 Apr 2026 05:03:01 -0400
Message-ID: <20260402090301.224-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <2026040220-defeat-jokester-22dc@gregkh>
References: <2026040220-defeat-jokester-22dc@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com,dartmouth.edu];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35850-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: D640F3867DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 02, 2026, Greg Kroah-Hartman wrote:
> This patch is somehow corrupted and can not be applied at all.  Nathan,
> how did you generate it?

I used git format-patch and git send-email — the patch had a
whitespace issue, sorry about that.

> Can you regenerate this against my latest usb-testing branch and resend?

Done — sent the v2 against your latest usb-testing.

Thanks,
Nathan Rebello

