Return-Path: <linux-usb+bounces-5169-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 096CA83050A
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 13:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA7BD1F2591B
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 12:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFB31DFE5;
	Wed, 17 Jan 2024 12:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YstKBRn8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1371DFCD
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705493821; cv=none; b=YbFY+xfFImBY6MM22DSV0xFTpIE+Vvtm84S0lWdjNQfMqy35ndaxfWkGQw/HbwnXjRE4E7r5FLNzaT4GfZ/0BkXxC85KghePLNoiLunyDrQKJvDr4WwLoZTkrH59VAN3HCuvKwK1UuNzhHxni5RLNdxeJkoFK8I2tRcABmoycXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705493821; c=relaxed/simple;
	bh=OpJejToQx4K+knHEYte1vlfrkNX17TwI7s2cvuHEnbQ=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=CZVpiHYiU5K3qXQMwnyYFdAlrfaqMO33/2Gyebgh0ZWnQUEPKmQHpxfA+rrnwEQW+uxHj0d7HztUmyG4UXL5LNtlM7B82VgzG5Ty2zLRTgjbczPZZFpvp8Ck2WuFHiCdvb0TjkEgVA//Q97/pvTVyCgD9T2igEj34us7r4mvj2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YstKBRn8; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-429bdb17616so229091cf.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 04:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705493818; x=1706098618; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OpJejToQx4K+knHEYte1vlfrkNX17TwI7s2cvuHEnbQ=;
        b=YstKBRn8esyrzF17VqqnquwfPv2J5O7vtIMGZspT39Uun1PgEy2L9ranfmmF5/59x9
         6XzkZXKkIAi/kTub2n8JddwokjcbOa3z/kqHAIIwhtuQtomw0fc2K1rgVwf/pWewYElA
         +Ma4AnD7AOqVrOtkKevo5QpxSaYT+GLLuwSN7fjZYf9zY9WyniFwxSC97Lrfi2SLyNew
         nx8aG/ykmV3Zo0CfUPO5UpkzquAa3n3QnNjBbPJ1Zy034sBK6ZZTRJOURS1j0t3D1et6
         VNmn3hJl9Gz7kWregzUnWiyFdjHTXTMeN2XAVkCbPYod1IEMZgMUpPkmAxTNiuf36QHi
         npwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705493818; x=1706098618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OpJejToQx4K+knHEYte1vlfrkNX17TwI7s2cvuHEnbQ=;
        b=GY3L6nFpYFFhgjeHUHuq6Y2v9de1tvNh9Tjf1Ix3eCsPvKrLwbLOfsZsLe1gWhJoaO
         v5nDKc6dN2t9r6N+3PAKre9TA3/6JJbfb8MdwSz9/OkzMyQPOfSCxRyG8hYXIwfOozJl
         uigKxKCseeO9hNiNwAsjsIOKtwEQClIS0xgnSemv+2rcWXcV7Sgorq93+lz3EmlwYHvH
         qxUqZMYNuSeVFLpuIkbBQVwJkob8L1DGTSvvutq78y11Pu5nafXTQ4vZUFjJ2SQLyAEo
         BuBtXUWYHCyF0Sso9TPXzKzkfmPpQSVv0clyXnZVVyRiCa7RBpcxcPVFQcjSRM0dTs39
         o6vw==
X-Gm-Message-State: AOJu0YwuTi6KDkuw8uuhu5Q9Xg7lah99qedoZHxdYlx62zSGf/YE60K1
	0rxQHaczTCekfV2Kz18Kno6MNkgUbDWFn1RaWfA1gRgBrw8Fe4AzZ/aLvWF+J3JlLN3ZSzoDY9e
	0GP/pEOorrM39Mv4/54QCjnYXWoyTQDZOZlIt
X-Google-Smtp-Source: AGHT+IGbkTp3VddTsYWxc3HXyEelUto79+MB2m+Pc8xfquBTdyaRHS8AqF3Ed1l4M4vyUINEDy5FtZlhuuyEIyuydLs=
X-Received: by 2002:a05:622a:40c4:b0:429:c6bc:330c with SMTP id
 ch4-20020a05622a40c400b00429c6bc330cmr150051qtb.14.1705493818526; Wed, 17 Jan
 2024 04:16:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110095532.4776-1-quic_uaggarwa@quicinc.com>
 <CAKzKK0qJOz_+pNAVAD8Ub6TZ9uhFOzuDC_bws9MVzxNa7RqYhA@mail.gmail.com>
 <77ffee9a-cd77-6a09-10ee-bdf17bfca5ec@quicinc.com> <8ba84432-bd07-3e59-3638-924d5fadec30@quicinc.com>
In-Reply-To: <8ba84432-bd07-3e59-3638-924d5fadec30@quicinc.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Wed, 17 Jan 2024 20:16:31 +0800
Message-ID: <CAKzKK0rjSxezNWfFg7gv4yWPga=_P27OA6O0OOVrHbiutJ53og@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: dwc3: gadget: Fix NULL pointer dereference in dwc3_gadget_suspend
To: UTTKARSH AGGARWAL <quic_uaggarwa@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> int ret = dwc3_gadget_soft_disconnect(dwc);

I'm not sure if the coding style in this line, where the declaration
and assignment of a variable are combined, is considered good
practice.
The other parts look good to me.

Thanks,
Kuen-Han

