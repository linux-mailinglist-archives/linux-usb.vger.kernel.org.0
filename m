Return-Path: <linux-usb+bounces-18941-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFCF9FF722
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2025 09:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA0811881A15
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2025 08:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3EA197A8F;
	Thu,  2 Jan 2025 08:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gd8cfPTm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAD8192B82;
	Thu,  2 Jan 2025 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735808046; cv=none; b=GYTMTduVNoh+zQLa/vumyE4ke6uvdtWxwfHAkDoSMTGHYD88KcgrMYV8vv+G0j5IPW4wH3gE2FiK2DhSZRQjgJI0ZbiCspLgwEmTxwhz40v4GovpvJDTXG22Y5YBUKLQLPdxvvTIcTXHCn1vS1KmoHPes3RaeslzPBlwAwijQ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735808046; c=relaxed/simple;
	bh=o2Gz6rmDPb4T0x04hcNbyOKC2M1HyK1ggBaq4cPVzBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AS0phFdp+4EBqzaxue7p5fCTC058GVgsAcWkjsV0v55G/DwTGJAXa81WE+ZgGGxMAbiqsjvE7RCt6DjuflYiP8qkcU8gbZSHAfsikQ/z5P4jjWR5FyA7sMgxZTpjq4EbFY0dk0nxdMTcr1lV8CTdeaHlhxApmMpuvlXS/Sfotzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gd8cfPTm; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d0d6087ca3so2296697a12.2;
        Thu, 02 Jan 2025 00:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735808042; x=1736412842; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o2Gz6rmDPb4T0x04hcNbyOKC2M1HyK1ggBaq4cPVzBc=;
        b=Gd8cfPTm5btojc/fR0U//r6vfCvVfwJplnmPP7lNJJ3A9OK5qZqNZA/SeZ/xss3ZR6
         mJaR5Q8IGKEgpKuW2U5CesLkLCancFRMCFvU0xfTze8b8RYev2mjvuNjjS3neInVSEJU
         3YWwE7c4VNBoOdWaKYfo/zARDMSe5Gjk8bygeJZlPGFMpXx4Irm0MXjRjAboC9+wLJQY
         yOZgPsO/qEy0rJYyP16+IKO7ah61aSCIhwobc5cTHoEAfuafMeyWtfBGUodRGk8TWoco
         hOeqzQotWlcl49YTgHoj0eWaECjvJIf/hHwCSw6F6lOwSP82K3shBbFg8iYlptMPq6Nw
         joYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735808042; x=1736412842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2Gz6rmDPb4T0x04hcNbyOKC2M1HyK1ggBaq4cPVzBc=;
        b=BbjsS3X0eQt3d73GAhZ6GMm9mZoH/C3TnH60570I3iE+9A6FFNntF7MAhytPbTui8J
         FebKsWoGVhnYuVpghUT6aKLDt3B4sc96e2xiQNHtDLg4q9xn/N01F6piHv7WwpuLmOBy
         27WJgwVik7An86ZyW+aDjTSTaQ2u86yLzwT2ywe49lYrTye3Y0TliXtfmAwZuphBdzcE
         FDNWSpmQtCnh46ghI3fzilsVxxA+SkmILzkuCnZmga/9yCAgkbPw36wE5x7v/mmrzv64
         0TVsVFRHJ/yZKC43BxS+sQJjb4pqSspYfinEGjRtKT/d6uA3y9u7NzaWI31DpZmI+Sh8
         6UIA==
X-Forwarded-Encrypted: i=1; AJvYcCVM1sycG4Uozca5tHzCNdq/C/J7PFIJezA5GBXOv3U/hrwME/GwdDhzRhImhTRfLIWSgVB/+C9QVLo3@vger.kernel.org, AJvYcCXS3dWOfDRQKlSGE8dSFtCl8LUNEJoPmRwGNNlD7hz0W+6V6QpWu1pFDKjRO2ljR5q3dyZ+UX+uNTU6NzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZCFwDWksb6kBMh8LiRxX5BQLVSLM1IEp/1yZAWW16GJwPgxF5
	v6EKc1XR/LsfL5ldutKY0plgqaz9LArGkI7gTkACJCgiEGx4mNvof8kohGqb+0bq6uib2lBKe/2
	lGKoiJzxsHMLjHj/n/XSqAbbTQFM=
X-Gm-Gg: ASbGncvcqb0WrkYFhqegcHS2JGgMJPbPOLE+h93IA22nq6pdnnT7lyu2rbubdEZMn1u
	joc7jK3C/DlCW5qUNusiXRtcE1RDrP151UDBo
X-Google-Smtp-Source: AGHT+IGP2mGzJPYIfaK4iqYui7GxTr3U4wXEHQ6cCUnVn1JczwAKCSUU1yoAzAku1AWMpCNbIPhxkFtwY68CYvGQLtM=
X-Received: by 2002:a05:6402:254b:b0:5d3:ba42:e9f6 with SMTP id
 4fb4d7f45d1cf-5d81dd9029amr13621388a12.4.1735808042425; Thu, 02 Jan 2025
 00:54:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
 <20241231154731.1719919-2-tomasz.pakula.oficjalny@gmail.com> <OSZPR01MB8434C2B2997FBE6B0DD7E53298142@OSZPR01MB8434.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB8434C2B2997FBE6B0DD7E53298142@OSZPR01MB8434.jpnprd01.prod.outlook.com>
From: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Date: Thu, 2 Jan 2025 09:53:47 +0100
Message-ID: <CAFqprmzhH00gjnWkSFq7utYTsQ+1Q4x+qD__Bhsafdq9v6i2dA@mail.gmail.com>
Subject: Re: [PATCH 01/10] HID: pidff: Convert infinite length from Linux API
 to PID standard
To: Shengyu Qu <wiagn233@outlook.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, oleg@makarenk.ooo, paul@spacefreak18.xyz, 
	f.kardame@manjaro.org, jules.noirant@orange.fr
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Jan 2025 at 05:37, Shengyu Qu <wiagn233@outlook.com> wrote:
> Typo, lenght -> length

Thanks!

This, along with indentation fixes in hid-ids.h, will be included in
v2 that will
happen 100% after Jiri and Benjamin add their input. I'm especially open to
better name suggestions for hid-universal-pidff.

