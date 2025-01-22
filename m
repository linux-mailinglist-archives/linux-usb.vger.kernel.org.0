Return-Path: <linux-usb+bounces-19633-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 736E0A19321
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 14:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C6E77A2ABA
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 13:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1680E213E69;
	Wed, 22 Jan 2025 13:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDiRCXnf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B80212D6F
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 13:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554347; cv=none; b=uBkLh0exW95tXk9WfHqdTrS0mmpRWnYXwnzjelyDEkcE75AFWreiWwimLI4dFv+2hAejRShqIfgMSvxmpb8RB/MwUnk+yNjZVJI13MZdivNlqYVi7raztZszpiYpq6Hpi4KTXxyf7uVkusuxRg4r71Uc6GbprADoFTuMHXIcKvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554347; c=relaxed/simple;
	bh=UdaHUzRvekvIphzsc9HNW8pK8qObaRCDFoLh2S8vrzU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=awrBtUc2gRKahUznNx5gqAAlsFjATyhGgW8Je5vLHVGFkDlHMCQKH1tOA97PEOz+YdJYTWMS5zK/K7WnT/jTC6FzqkAWlssbriChlOddUhrp3FSWL5Tt2Oht1zvVWrFHQd/D0d3GPqZMyWF8YVrUQPPLmyJfsdS6JY0Qrv+RByM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDiRCXnf; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21680814d42so113993655ad.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 05:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737554345; x=1738159145; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oA+bRb+64BVeWTZDRgsQz3WBRZLLSEFUOCIrGA5jVAU=;
        b=QDiRCXnfutyu7hRVT0TINvSCYGzqujnW+fmJrNfY9LFHD4uz6CuWleM3iufSMIHYqZ
         TYobRhIJS1AZYJMWidWrKgAvqkj/UGZ9Nufdu6UIz9MTRTQXLsE9nDY9Ihkak1HGc26D
         5iyJh8IrzNBi1Ue8Yy/mfrxCHyx3vB4+fdmQU79B6gpBfo6DiAHgJWLlrRsDuY9UhFst
         1vMnggufX7wJ3bbz9zEfhpzEL/m6Ayp5quK6sgglN2jqYJGtgZ4rgGH67OkFh0blCVKh
         FAEi5DluaNMo/i1FSCiT3jMiIBBFgtU2weERyfAAJeXtEzi/C9/XGrzYXLqWpAnXDVby
         xpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737554345; x=1738159145;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oA+bRb+64BVeWTZDRgsQz3WBRZLLSEFUOCIrGA5jVAU=;
        b=gz6blvtdnIeoBm5fv637dYUsC7llZPiZ6x9TBjnlFDTTFinOWZZOb6iBkcr5N++U5+
         hhdGl23B2hYpHbIGqbPhAts+Mk/1ZcGtxR+xiCdEMflRqZLaeJtEpt1kt9ZCSvkLahbJ
         8hfcYYG+URFPaH+Sq9pOxd+60oniNe58UBA8l+g3lopvCQ4ZB4FM9f+tc6c18JfV/sIC
         MVYU/aXBcNCuYGm2NKOrorRxxEVx2Ub3mi+ldPjOITkLQRaWO87ajgTmZOnTGaR2WYCo
         AW6T4BUy9Ui8d06GHCsRa0Z70Pj4y3XfH4SPH4vNb74KVypIcHq/cmGzJeZUbLhG4LU4
         xIhw==
X-Forwarded-Encrypted: i=1; AJvYcCUIxShartlEjJCDSZ/uhQlPr86oCp3BnmY5A3DCpGECT1nrerRqDj8kt33/oK1rUwYiTKXsWRcdV7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhzE/ShPZMUWXo9Xm96eb6lcI2KGmXGGm8JEwkSCaMoYeSef0R
	6TQmOuio+ViwL5uqCfmE0bKd6DFHLeiQc58qbhrSKMSR7yEQLs4X6QUfGPeIPCE=
X-Gm-Gg: ASbGncv1OjJYoOFdoZJNIV8A5VuKUAlmpEI5Fbg6TVmt2BKXqm4M2oXVZB2aqvLa3q9
	9X4Y1E1pSou0yrbkTkCxCm0HVTr8kwAWEQI6yOWK3SBnFk+9t3R8pYsRm+B2jxirU7BchGT0MsA
	C9FotcjyrPBllngp1nCgsRZgo8JuSGyg31hj9ZMCcNDGsVIsCy4LkDv2borzp8qP7FuZZStUain
	LIe2j966I8Nd//p528PNEt49GlYuCMxPmMGlXz7bFvgTDjPcWwiYmUP3Gxszq6SIeOBv83r8i5j
	aVVbMd3ej5IYXJlBA9gNRx8ruch9mG7mgyc=
X-Google-Smtp-Source: AGHT+IG4ZkwkqMVDWiJAR/78vdRwdpr5FK9oWJI9lQukaCrsCfQ8OnDCAnOHrfDN7WUpsdHgthdWxA==
X-Received: by 2002:a17:902:e743:b0:215:a039:738 with SMTP id d9443c01a7336-21c352de481mr354253815ad.5.1737554345230;
        Wed, 22 Jan 2025 05:59:05 -0800 (PST)
Received: from [192.168.17.127] ([152.230.224.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2cea0514sm96224965ad.21.2025.01.22.05.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 05:59:04 -0800 (PST)
From: Camila Alvarez Inostroza <cam.alvarez.i@gmail.com>
X-Google-Original-From: Camila Alvarez Inostroza <calvarez@macbook-pro-de-camila.local>
Date: Wed, 22 Jan 2025 10:59:01 -0300 (-03)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: Oliver Neukum <oneukum@suse.com>, Camila Alvarez <cam.alvarez.i@gmail.com>, 
    USB list <linux-usb@vger.kernel.org>
Subject: Re: Your fix for most_usb.c::hdm_disconnect
In-Reply-To: <2025012247-scrunch-nuptials-cf11@gregkh>
Message-ID: <8fb2f3dd-99ef-b000-c5f5-44da149786a8@macbook-pro-de-camila.local>
References: <e8310fd2-caa7-4a78-8ff1-2bc2d07d74c1@suse.com> <2025012247-scrunch-nuptials-cf11@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed



On Wed, 22 Jan 2025, Greg Kroah-Hartman wrote:

> On Wed, Jan 22, 2025 at 02:44:59PM +0100, Oliver Neukum wrote:
>> Hi,
>>
>> I am going through syzbot's list of open issues.
>> It look like like the issue you posted a patch for
>>
>> https://lore.kernel.org/all/20240730035745.110637-1-cam.alvarez.i@gmail.com/T/
>>
>> is still open. Can something be done? Has the patch been lost?
>> Is there a remaining issue?
>
> The subject line was totally wrong which is why it was probably ignored.
>
> Also, are you sure it is right?  Grabbing a reference in a disconnect
> function feels very wrong...
>
Yes, I think so as well. I don't think my patch solves the issue at all.

thanks,
Camila
> thanks,
>
> greg k-h
>

