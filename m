Return-Path: <linux-usb+bounces-21420-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37460A547C9
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 11:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87B60188AF18
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 10:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36517200B9B;
	Thu,  6 Mar 2025 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSch1qIl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A29D53BE
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741256974; cv=none; b=YzZH0apVdE9Vo9x3/Q+iVX6nF/MXr/QYVmuJUBSylCEQ0lmtoyJtvXAe/phRGJniT5XBA14xvUz0JeAg8BwpOzRiKOpnlXXWFYdTGNHQtmGjBbhKzW4e8RZFjT70O+CuJAKmclDd/qGol/ydkPYrTuhe5GCsprvRlnJ6m4spK34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741256974; c=relaxed/simple;
	bh=mOtTzFkjx5WKiRtUDGL9PotEdp4jmVc4QOO1znZfWqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=thdt++iP7YZx5FSFY9R4hLzeDlVFxttPlIlbROHwVeC0WLEFOUD+jckqVV0ZlPgW8PqhXzp2TmWSjP07HjgV00Fr0IRB/gU8SSXb5uXJGY1gZOllen1X7ugtSudH9gBhownPNebyMlFqad4lExPRKaa9o+NkngnMwVBlRJRx7+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSch1qIl; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2400d1c01so40583166b.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Mar 2025 02:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741256971; x=1741861771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQ8m/eWR3ppT9LmZCkvdBL8rAoMN61qtVTHNVatCrVs=;
        b=YSch1qIlVgdIMAngHPmcXKHoZC+KE//emXdtJtFs7iu6WKmR96cOwx+Yv+FPyB+TTw
         gIYmf4FYFYC4Vh617McXvhRswIxAp7XLlXQYxNauny2KPhMN4evYEG0seRHdDqV1JT81
         1gt5P6qlYZpxH9b1Zja+l8ysDg7LGd0hOh3rl3WLIwcT2gpGw6kmQqD5LRPA5wpH+uAn
         PUujMj/qcfHup3s8x6ZngUr4pXc2x/Jl7M8R5ObQO1Gpw/CHWrpuIUoR6tB6DmkTwair
         Q+0/f61q0B7AVYfOYkC2Sg2D9e1sS8uceZZj7cuJvhD6JjC2L5UnAXGT0xQMUuU0yvS9
         zotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741256971; x=1741861771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQ8m/eWR3ppT9LmZCkvdBL8rAoMN61qtVTHNVatCrVs=;
        b=h2+XYMKFIH6uUkJL8kNO9uJNMe/Q77BBm0ws7Dh7c9iZcoQgSzJ4N3vzY915U/gOHx
         N0xb21jUT1CrNG7fI2LBkX5sPzBIoTop0m3cn5gxISZIj9I31t6FRMUvM1cP15AojbCG
         z+Dt5eakn7+zazfdUP9gToKS73FcWCmOaNULqjrqZhnunQuJ3+8M6n1mDji2RSAVPvdg
         XgPYlQ8Yrpc66A+b9grZyKXxfpQYJZf1+H3Mb7ZKXFEGsLiMA37Le5C8UTIkeJeDQXc5
         X437z1/Slc8ZjT0Tqh51+Jt/dOxjlIxaTWjW57hUSCO7wpjazEf/ykwBRosxs0lCxk0n
         ol9A==
X-Gm-Message-State: AOJu0Yw6EeYRMenKLR+dJsmzBmwOIRwxZgbxDmlAG1pqLW6R6FX1u4E/
	ycaW1U9YH0HmQLBUt3i5x8tP97tDsGapsl4Dhchrbw2atIDKW35bkn0x6KoMX5aopbHJsKW2NK8
	qmjgSFjg9WevgTkaEpS1GpgTXgvc=
X-Gm-Gg: ASbGncugPyYwH5z7aERHqv8yZZpP1oFBDU7KgZPBsMvXTRGPbEpScYAxcImiHqFFA2b
	vcp3X/xNujqdISVFlhH34hLAK1wDoMIp/AT5Od4R2uU1jSy96aRhP7Q2fF/9D6+Py4hBLZMrs7J
	zoTCGfNcoToXROF3iZqohugG4=
X-Google-Smtp-Source: AGHT+IEtK8Kuxvqb4uEJRWKWE81RCyz/kaiyn8SciTyzZkjjuqvkNRrFWWZCHJ3ZTd8oLoMZXQLp1/h0MQCyLZgeNlw=
X-Received: by 2002:a17:906:f592:b0:ac2:3a1:5a81 with SMTP id
 a640c23a62f3a-ac22ccd0554mr219372866b.26.1741256970911; Thu, 06 Mar 2025
 02:29:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306084145.373237-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20250306084145.373237-1-mika.westerberg@linux.intel.com>
From: Yehezkel Bernat <yehezkelshb@gmail.com>
Date: Thu, 6 Mar 2025 12:29:14 +0200
X-Gm-Features: AQ5f1Jpjd6mk3FG0_Y3NZBdKd2nyk_ZcIMZBUjbhzU0gmlj3C1_9a2pw2jqfI-c
Message-ID: <CA+CmpXtBaaqzyJ8E8G7f5DA4AQ=6XFGk28h7LvNLHaG2ubwjKw@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Prevent use-after-free in resume from hibernate
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>, 
	Lukas Wunner <lukas@wunner.de>, Andreas Noever <andreas.noever@gmail.com>, 
	Kenneth Crudup <kenny@panix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 10:41=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Kenneth noticed that his laptop crashes randomly when resuming from
> hibernate if there is device connected and display tunneled. I was able
> to reproduce this as well with the following steps:
>
>   1. Boot the system up, nothing connected.
>   2. Connect Thunderbolt 4 dock to the host.
>   3. Connect monitor to the Thunderbolt 4 dock.
>   4. Verify that there is picture on the screen.
>   5. Enter hibernate.
>   6. Exit hibernate.
>   7. Wait for the system to resume.
>
>   Expectation: System resumes just fine, the connected monitor still
>                shows screen.
>   Actual result: There is crash during resume, screen is blank.
>
> What happens is that during resume from hibernate we tear down any
> existing tunnels created by the boot kernel and this ends up calling
> tb_dp_dprx_stop() which calls tb_tunnel_put() dropping the reference
> count to zero even though we never called tb_dp_dprx_start() for it (we
> never do that for discovery). This makes the discovered DP tunnel memory
> to be released and any access after that causes use-after-free and
> possible crash.
>
> Fix this so that we only stop DPRX flow if it has been started in the
> first place.
>
> Reported-by: Kenneth Crudup <kenny@panix.com>
> Closes: https://lore.kernel.org/linux-usb/8e175721-806f-45d6-892a-bd3356a=
f80c9@panix.com/
> Cc: stable@vger.kernel.org
> Fixes: d6d458d42e1e ("thunderbolt: Handle DisplayPort tunnel activation a=
synchronously")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---

Reviewed-by: Yehezkel Bernat <YehezkelShB@gmail.com>

