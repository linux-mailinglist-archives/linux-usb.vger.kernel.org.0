Return-Path: <linux-usb+bounces-23906-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D01AB5368
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 13:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9375189F947
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 11:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5607228C5D9;
	Tue, 13 May 2025 11:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VEzTfXuP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEB428C5D0
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 11:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134167; cv=none; b=IBWLHrKr2TeSVxgE2HXwosh29V5GAUVqxgiJF+qVoSa/06NRckeGF1Pv9mWv0zNB4X/0Ue8DvPoxakNVHFH+MX1EEiGeWNWkdYxtGV72LmmLRSyom2kMotm7PEK0BJz4ZP+QkwXrEcICZErlmdgwj0NX0LJrclRtIsK6w5IGUdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134167; c=relaxed/simple;
	bh=qW7x27BG1o47jEKIviyStmGi5ULn2IaGLuDz/3YLm/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLrNfhs2r+uMPXtIxufVCSevlkgcoo7/q+6oVCIeOofQbQe5NyU0iGedwBIdRCZdpsLmHJh1hhK+2iQ6va1EXqvbyORkEF+XP6QVDOOsoQxjMznnzpatmAMSBgWph+cQXjEIHfpcPa5Z3Q1eUtnQkdRuNEtIwfTK3ymIawX874g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VEzTfXuP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso3342135e9.2
        for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747134164; x=1747738964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PB00fZEqxYsjfcxTg1f9ETNtfe68ftiGvac5kWJq090=;
        b=VEzTfXuPsm/ArvF5O2/vKGdQ+GLg7hwHo5P33BhPrpoImotVZbjbf/FpTR0qiGE3yA
         Hdso2gYICm2kBINgtzkNJv1ToLkbc3Ra9Yyi1jVfYuRuUJV7zq/nA4+AYUwbg2fEijk4
         j2yCEQlNmoN7vzKgKLw7QNm4gWkUxqFsZdWriCO9SoVcSswbVQwWjjSe6zOTDTyPyFho
         tgm9ZhG3ko8YcQJGUcnq3mU0al63gYTy+7wri9/PboiO+vpnLHPoujONiXvTDtauB4r4
         winQMId8dXnH33vCJdFlNgLCNzLzUYhXUuze3CRf/RHLJIGXP7WGK2o21KyHbcoOFFkg
         axhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134164; x=1747738964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PB00fZEqxYsjfcxTg1f9ETNtfe68ftiGvac5kWJq090=;
        b=raO1wsjuBDMWiB8gzcuY/vljnYnj7djuVuRLD2zNOi9h/HISFxhKPiu8u+a04EndD+
         DEtqqr23DPz1aB32HiTLncGgRPjnW9nyAPrnmfKZDwpv9cYJoK6yeuThyuAnOHfaiM/z
         dfuFIRk6727FHdBhQOctdMKDTe5yKC+ZMsK1uRXy3wu6eVGHek62tUUYpMEKgHeJDOnn
         h9k/zmhMTWK8L4uwchilHnfXcOD3dsPeajNZcDqqaUGbionanQn6d2IhlTAAZ1wcKXnA
         ItFsDJt1x/fv9ITRnrKADj09t0Dx8ORiignGgQzvxRDCiZ2mRaqLcs0cmu7VL+6Zi9fq
         KHjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2VAgy6JJgBDFUjmkaw0E9xSNs4tPevoEHcqBzOvcc4G/1yppbOaICTTrE97IlFAYMuhAfjrUxKKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH4Q+cQiAUBxgsdU+IScWmU07NMgn0lQLSt2IdLPIGLumIZBzw
	JSaHalz3kfTHjEB1GpSe0y+v5Mna0H/NX+s47Ep6RQ+RBpLuJMAPHtD5UeTxDN8=
X-Gm-Gg: ASbGncuwIf+z/33NZE16+Z5Tqtmq17Thk21AY+Kih4m14YVcS8YHH5r9AAGXiVsHWaa
	sz2smSOMGGETG8FXQYAY+7c1EctGVW7WorbjU2mCkWIwOW3y7yZSSsuZR9YuCCyuUznM/K8yxv+
	+Y/jwZso8eKj/qxm4PW9jhc+7d2/xKPuv/FCkUk2Pl1hGVE4W7dTfyF+IrdJkSgv+ulHa+x8MWy
	IhXZ/kokOFLiobGxGprLGIdLLo175Ptvg9k9RbeOFDAUt4ICjMAeIkVkSEG/XYcG2RChHeHPgqv
	24BXaXAWtLcnb3If72ITDrmZKz2Em1jVDugxxPpZ7qCcTc46ZOmJf8evnrpV/Uc3L4rvqvfCwd7
	DKpuvi10MsRnCrOcPfB4=
X-Google-Smtp-Source: AGHT+IE23iKIPkC3brAs59b+RoNtLLmk3PHJFrud+oX7VROxL8zT9jC73E7jCw3a0O7Bkis1l6sPtw==
X-Received: by 2002:a05:6000:178b:b0:3a1:fc5a:ecb5 with SMTP id ffacd0b85a97d-3a1fc5aed1cmr9612765f8f.36.1747134163845;
        Tue, 13 May 2025 04:02:43 -0700 (PDT)
Received: from ?IPV6:2001:a61:1335:3601:f121:69fe:935a:67bd? ([2001:a61:1335:3601:f121:69fe:935a:67bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5e1sm15564687f8f.89.2025.05.13.04.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 04:02:43 -0700 (PDT)
Message-ID: <3fa2cbc3-fe81-4364-96c1-b753c52ddc16@suse.com>
Date: Tue, 13 May 2025 13:02:42 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] USB: core: add a memory pool to urb for
 host-controller private data
To: David Wang <00107082@163.com>, Oliver Neukum <oneukum@suse.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 stern@rowland.harvard.edu, surenb@google.com, kent.overstreet@linux.dev,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250512150724.4560-1-00107082@163.com>
 <20250513055447.5696-1-00107082@163.com>
 <48d5cae9-ff7c-4076-8b71-8c16bcf00443@suse.com>
 <4006cec4.794d.196c8be2fd1.Coremail.00107082@163.com>
 <b07c7d9f-a20a-49bc-adbc-d43326b2d2df@suse.com>
 <3dd5e698.921f.196c90c33af.Coremail.00107082@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <3dd5e698.921f.196c90c33af.Coremail.00107082@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13.05.25 11:49, David Wang wrote:

> Hi, I have one question about mem flags.
> If usb_submit_urb wants a memory in context of flags A, say GFP_ATOMIC, but I already have a memory alloc with  flags B  and its size
> is big enough,  is it safe to return this memory  to usb_submit_urb  which is in the context of flags A?

Yes, that is perfectly safe.

	HTH
		Oliver


