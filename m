Return-Path: <linux-usb+bounces-6879-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF1185F4F2
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 10:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 457A51F227D1
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 09:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA6E3B2B6;
	Thu, 22 Feb 2024 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dKkOC5yO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E070B39AC3
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 09:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708595233; cv=none; b=q995Wb/9MxoTTS6yqqMNJJnBRgqvw7tlN8EOVwXETrwI0DIivg14r0NReMO/aag+QcTQcypm26rluTj+Jk9+sDZ2/SoZpJPIF9Rf30Wu0oOT62NCnAWgdeNEqIQTJCRKSQ4VgAJd/4hxGwfhNIAU+UOGMFO57uYfGctoiWuAqjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708595233; c=relaxed/simple;
	bh=p/NLjmUdzl2udebkQzhZYTZge1vEW9JNghSztBz2MFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pzGmZq7ZdOwvW2CnsVVLaQJdYefII92i+vlhBRIk3aEZQyt7nfrMzhz5DTi/lq8gaJf0RlvP3x95WMGQdOOVDaZ+EsN6Rvd32yElGraGkhfoNXUIumZL9l5wr0FkyO1P9HrwhEt8RdDE2giPUW5zTDbYlBA/ZHm+pocAAfbZD+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dKkOC5yO; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55f50cf2021so2439030a12.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 01:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708595229; x=1709200029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhVnYESztk5T2B/6C2k8gNoOah30/4ZRZ/kF6+4P7Uw=;
        b=dKkOC5yOlC19qjiK5+6HgiE05WByhPHUONs6zTMjmmp6Atvb+aou1+TTyrtEvUqjsC
         NEGMC0ymPtoOEHmhMxikyhcrnUtxvS02y8dzohqdgtumJxVsLqdSmzcv2xeOK2W4yMuJ
         ZA1+05W8i39/A0jewi834v0Y0+GAz/I1kuOw1EpYEjTQNmFvtwjoRFPNN2KFHW3miO2h
         W0Z+ZtN5b/lsnbOgm8PObuxvOrt6x2RHisRNSXoSLCU9ejp3Irox4wcnXJ66QK2CdCo2
         1JTZdZfnPIIdzi6bgHTu+pxjQOGMJyz6mnwQYf7wFIEEIoCI4GIYmz9GsG/bLIIIOSUi
         UE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708595229; x=1709200029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhVnYESztk5T2B/6C2k8gNoOah30/4ZRZ/kF6+4P7Uw=;
        b=tpe5EZXnoD4KJqibtbHPO5TAnaGoctO1vj0B3ELSo6C0QZ8vqscwueWHL0KV/nXOKH
         9Ssdf9k9CT7dX3dOnLCryEv5MTHND9a/KGnrPT4DixH9/IKm3/g5AG3V9e2zB3pa9EYz
         QRA2MJVI448Ll9BaO9Wob8V8CQKVB2683op9yLawotTuZ67UORuECSjg+b7XZfDJp71E
         toSAfUICaxGHm1koJKm8H/Q7WmjrtzdDm/XxOtaAKJwQppbVkkV/l8mWts8D3ZKlxzog
         EHtAxR/6oplfT/L7VFx1/wKkLX3Vy+GEkZiyT7iLvap0eu4O9iPODPhw6+TJpz1pGhnk
         CAhA==
X-Forwarded-Encrypted: i=1; AJvYcCXN6zb6pSioZ861QKFmBErnyiSA8OvECGuyMuEG07OdvI+FGf7IPGysaMoG9JwoE8tr+8eGlkEymwREeGrLIqb0S+wZGvxatDTT
X-Gm-Message-State: AOJu0Yxb/iYwrBGb58kwuoW8Xde4X2wrO/21OPmAer8C1Abwy6URJrbN
	ou5Co6cyYU4r2ZQpJ213/2aMpOQwZqo54G/fLaRI/C7+66lnrwTSRGqdu1DBfVQ=
X-Google-Smtp-Source: AGHT+IG1aDzb+IIVwxggYxnhkecGvu0RiI61eOavtRNRtUy9JvH30l3jJlU3ceQLnu9hAqLoy8dj9w==
X-Received: by 2002:a05:6402:693:b0:564:56e0:5643 with SMTP id f19-20020a056402069300b0056456e05643mr7560672edy.27.1708595229208;
        Thu, 22 Feb 2024 01:47:09 -0800 (PST)
Received: from ?IPV6:2001:a61:1366:6801:d8:8490:cf1a:3274? ([2001:a61:1366:6801:d8:8490:cf1a:3274])
        by smtp.gmail.com with ESMTPSA id q29-20020a50cc9d000000b00563a3ff30basm5724081edi.59.2024.02.22.01.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 01:47:08 -0800 (PST)
Message-ID: <3ff16f34-07a9-4b7e-b51d-b7220f08d88d@suse.com>
Date: Thu, 22 Feb 2024 10:47:07 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB:UAS:return ENODEV when submit urbs fail with device
 not attached.
To: Weitao Wang <WeitaoWang-oc@zhaoxin.com>, oneukum@suse.com,
 stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Cc: WeitaoWang@zhaoxin.com
References: <20240222165441.6148-1-WeitaoWang-oc@zhaoxin.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240222165441.6148-1-WeitaoWang-oc@zhaoxin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.02.24 17:54, Weitao Wang wrote:
> In the scenario of entering hibernation with udisk in the system, if the
> udisk was gone or resume fail in the thaw phase of hibernation. Its state
> will be set to NOTATTACHED. However, usb_hub_wq was already freezed and
> can't not handle disconnect event. Then, sync cache SCSI command will be
> sent to this udisk on the poweroff phase of hibernation, that will cause

Wait, this seems like a contradiction. Are we in thaw or are we powering off?

> uas_submit_urbs to be called to submit URB to sense/data/cmd pipe. Then,
> usb_submit_urb return value -ENODEV when device was set to NOTATTACHED
> state. However, uas_submit_urbs always return "SCSI_MLQUEUE_DEVICE_BUSY"
> regardless of the reason for submission failure.That will lead the SCSI
> layer go into an ugly loop and system fail to go into hibernation.

The thing is that the SCSI documentation explicitly tells us to return
either SCSI_MLQUEUE_DEVICE_BUSY or SCSI_MLQUEUE_HOST_BUSY. Now, it makes
sense to tell the SCSI laer that a device or host is gone for good,
if we know that. But we cannot just introduce new error returns on our own.

This needs to be addressed. That means that the SCSI layer or at the
very least the documentation needs to be fixed. Frankly, this is not strictly
speaking a UAS issue. Any thing hotunpluggable should have this issue.

	Regards
		Oliver

