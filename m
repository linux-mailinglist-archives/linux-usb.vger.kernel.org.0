Return-Path: <linux-usb+bounces-30921-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BBEC861F6
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 18:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 439C0352BC2
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 17:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA60032E74A;
	Tue, 25 Nov 2025 17:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TG3BksSS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C414432D439
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764090073; cv=none; b=Sq3LKH2frO/f3M3p4PT6O2Epmdw7ayLwJquonDfFZPGIjglQzGx/fI88i7EfRhihBSt0oersB+4knlN8M5Rv9ZKZD/qvFwpoEomDkthf3DiEb2sy12Un48FnVq7t89ywUhbOEiBBGMmFUWHgmMKpiQCbQGg78TkW0NySlcbgjBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764090073; c=relaxed/simple;
	bh=ZWAMKKmgrsxx4JGoTZ2zC6oWhLCNBA5peXg9n/HVN+8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=GCIiSRStiq8joAqF4kWdMJB5J7Nn5lFyCeR+LbXJMJcQg8Ld/TfKizj7Vo9qhx1HL5/8F8JBoLMGLQhjCsDKxWpsn8lsbpLZdy+lrLJDUxXEjnYY/BWQcN+0idCvdVxMRN73HfJ9PGOC78FVkM03IzKkMrff1nNj7Gmpq7OJKXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TG3BksSS; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29555b384acso71987255ad.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 09:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764090070; x=1764694870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWAMKKmgrsxx4JGoTZ2zC6oWhLCNBA5peXg9n/HVN+8=;
        b=TG3BksSSEzGga1EO35clHkbCT3KnZaoijugl4g1FbEJLGJL1unSVHDmGUsfQyMjq8m
         2XbZqf9fMp0X6kuaVVECryhbfyN3updSrAqkUnKXYKw1Itf2faMwM6u5U/iDzkGg7qIc
         cZ79i167Uq1+X98Rj/y3kaUvALnmhWpiH4oJ4cfDgmTeUAgSEeNiNHOQapp971+Zcz6K
         ME8TaLTaw9CvL9WXA1A+7cixa9V3N+jfMSUCiMsHPbrOYmZPfnIAaT1T+pS2BSiVSaEM
         N31GD/YGezj2977VwWZmvqaShalIXZZxjgeNqEHXdMGCBntTbnCi5aBbzVMNccq5mysB
         cLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764090070; x=1764694870;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWAMKKmgrsxx4JGoTZ2zC6oWhLCNBA5peXg9n/HVN+8=;
        b=wEj0UaHK08XRycwQgtIJsS3OAshAdrA/IR1pe4oO9NKfoUh+jootNdznjVOf/OE9/E
         575Gm0zt9z+p1aoI9NAJfkFBLnlwXjc+lTSzpnHHmjN3GIxIsD2IIuv0hs8rZOAhhMfy
         0fwy9bIxi22Q2AU+KehFpHyEFk14GrEu1itzWt5J39yAZ0rMdJpm/8F6BMxKf4kBkV3e
         t+MnzD81nFXa+DGYCUNKaRJL3bUl4+auXgC36A5RDFOmJlNbNENrOcfkGR3d8v/HiKgW
         Pd+LvcAsCPp/nxmjiUcPB0WHuNMdS3NIpr0ShmsEcEuckSz/fD6TWjxHFEWQAcvcChHZ
         eVsw==
X-Forwarded-Encrypted: i=1; AJvYcCUyD8FAdNRn5OpxNsWo5r32xNXL8Y06AP8aR9UcWYTiqSJ4K7pBaJVVTH9rvqCKbPybGN41b4yxToM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJngiKt1pnV7kDLWdeV9HwDuLgJfPIfdRdYFvFiijoR1CHW/Fx
	xy1HebHWNbIegxMxzWVBMlPC1BzLNPeCC+5rh5rz4J8AIZw0sJUlXnkz
X-Gm-Gg: ASbGncvwWztFCSGYN+TcEE/M1kUaeyDFuEdqcvda5v04Or6mT+R5jOWbGKPnbXzd2B4
	IkIkaL4hd7HWpSJwI3OXvMtdT918DJlOLcC2IPu1rSXfwxGJw5hlDiyFMp+3YHbjSRIxezgsv4b
	2jwKm76r9nPloFGnyO4Rm3IG347tTuVKAlX7WnbKMat8hIu+LeQ405LPvJwjREm0vr0X+pz+MqM
	JDu4CU1H3xIvn+ixrxJ86tKjQ1JKylL8fNweZCmVG5Yd5Rf0XIy5gavF08ug0eF/MQC7LBvhxVK
	graUvGaxHfpGj6H75C0Lb0J7bc4H6uv0HBW/h2OUw/LGl1cGhz0mmzCZ12OSqb7dh6h3g4CgQdo
	2M++k6Cf6CJMuHUB/VVmXzgvNvyd2RUI77UTeFU6MXpPorDqc3K/MHV/dmw80BJR2jZdllaLmG7
	f2uhk8ziixWL6IdNilhnSpCAo7xw42EQ7V+eFy66FBVkb2bLEay+zp+Ks=
X-Google-Smtp-Source: AGHT+IEhFYICnUs+QCI6cv+QJhHWyIoiKr3TM17aLru8XDaUs+llQV7KkXJ+bKFQqjMPMHOux2Ry/w==
X-Received: by 2002:a17:903:3d0b:b0:290:91d2:9304 with SMTP id d9443c01a7336-29b6c3c2864mr177104845ad.4.1764090068323;
        Tue, 25 Nov 2025 09:01:08 -0800 (PST)
Received: from ?IPV6:2405:201:31:d869:c163:7f74:bed9:a2d1? ([2405:201:31:d869:c163:7f74:bed9:a2d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b26fff4sm174669705ad.68.2025.11.25.09.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 09:01:07 -0800 (PST)
Message-ID: <c0152541-a1ff-4eb4-afdd-5335150f29ba@gmail.com>
Date: Tue, 25 Nov 2025 22:31:03 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <692560ec.a70a0220.2ea503.0087.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] memory leak in
 v4l2_ctrl_handler_init_class (2)
Content-Language: en-US
From: shaurya <ssranevjti@gmail.com>
In-Reply-To: <692560ec.a70a0220.2ea503.0087.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

#syz test:
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


