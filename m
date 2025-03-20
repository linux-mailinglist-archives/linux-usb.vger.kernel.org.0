Return-Path: <linux-usb+bounces-21943-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F15AA6A1E7
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 09:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15788171BF9
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 08:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1062321CC58;
	Thu, 20 Mar 2025 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A1dPiVL1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A350A219314
	for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742460921; cv=none; b=FzA+tCyo4YgTqQhXHbye4Ij/y85jb6DQnzHOHqUuYjxYQxE76z3/74ZeD28lMj7JuZsTsidoi989YnC7ZrJH9WTU1O1cZSXkftbm3od8jFDClOukgnUFZxZYuQlElP4FPiqQ7vcbsWUtqbXr5TpO/k+RUOWSpSiq87DGCLVtOuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742460921; c=relaxed/simple;
	bh=xdEcEMtpUDSoZpKEPUUxO32/bBHfrn5dJLu0mCdxQGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SYCe7n3fixnFPTOh7ShwrCCS8AikIDwYHKUrX0cYPXMtqJnCFGMzzkQk/sOo5YxNVsZQDT3dxTGcLyMy946kfXF8gXX7UrqfuvuBrm2P9H0CDeRAWhpMwRsROEWjQoYiq7dpen8qjq/l84QNkjzIlKRprisfrHnWyINC25gL2TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A1dPiVL1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf257158fso2905045e9.2
        for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 01:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742460917; x=1743065717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2MrfgjPAqlNn2eUud6G1hK5xCroWzCbZXOyHt9NcJeY=;
        b=A1dPiVL1A7myzN3Pb2Tm09c2n67GkAhkCtQOjZ8cjGcntGxZ75WhGRU2N1deBnyV3f
         ZoCVAdwv39xGVpwqFg+mztgBrClyLUAzPxHrBLl+qbjmdQ+Y3/Fx4QLpkRB5IQeWRv8x
         D16NuDG/ML9Y6BqJu0MYmE6KieuNDzma1Tr69NL/o1LagFjQfWpXh7BWraj1I2qgsLmD
         9i+mPaTOsbvqHYX4kpL6lWkbgHfk7YFBCrGwP44wGucgrcOC2bnfwK81xOR8cyrMjL/2
         rhwsJLqY/a3+mp6qtPkIs+dSRo3y+h+N185uTNDuivoWklxakd4lQBJlVpVBHljSF7zc
         bvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460917; x=1743065717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2MrfgjPAqlNn2eUud6G1hK5xCroWzCbZXOyHt9NcJeY=;
        b=BWe/k6Qs7nUGnJ+0QqLRxgGv1imWMB5aFaBOO8vv3lE+8Dx7AgasKuwl/qPfjF/z+Z
         wk41Vct7c6/hgFyDEJp5QSVwGzDDjThNeNNci+ZuSTlfYPVQs9o4Wej8iHxCkFLxnm9e
         eMOfAoUu4vQvyRBkG/hS6vdj/tqcB8bj/C16uSZM7efMKNVOggOH57py6kgKnkSnDc5f
         niHJOKFOgsk2xWik6IE0WKsDl8p2jK+MvDXNxgj8Xdb4OjDqLWOR8P7hfjD2+2Pd5X/7
         XtRI/2a4bZYWgIRAzOJ9mZwfelrC9VCqfu8xyXU+MvYZoaPl3KZkAMKSM/kniovq82xP
         bRQA==
X-Gm-Message-State: AOJu0Yw+jupx5alvW7AEyMB+RZwsH911gNm+Tz0pStMTefVyM6EEfS6F
	5Xb2NggIUobYAuelEltV+7++/RSW9MkJUJiT2pfGwxnOkKCO7bX8/A6MG5NSyRYuluCgzlIzMu/
	p
X-Gm-Gg: ASbGnctQSWenbT/WGG/M1h2dnZpx1EuutgopcZmDIyuVj0JGKxqK8Aav6xhRr0jKV7g
	JVXOPfoO8VdW5+Ju+BQ7QHIlgQ4wNdEO0I4N/3dBHMYz4i1PytxP+XfbxKCmJRijAsttM7Cj1LS
	e0njUejcKUZhQ5ypHzjX8L0C3B/IIWzgjZU3GlMa/JxQc+XrzMZ7FgRqMTcjGZKF27VdjNYoC6t
	hfd6z5wQ7KxzAKH80zp/jGh/ndNOLhM4tX2qP0aA5vt/mBqSH4hwGA2dLpStWcMM4U67jdt2+Dr
	juXw0hvZBwgyVT2pcAARxCeuwECdokDE1SQ5uKzVWtxmm3Mo1OYtDSLycdb5Vg0V8RpbHBiN3BT
	hbPikqMACHrtNW3BCv3uCMA==
X-Google-Smtp-Source: AGHT+IGU49v/Lhj/oen+zcnHCh0eZR5eOnW4KQbs/Ef8gsM2qEALp+P0YL7mG8wyU72gTByAWx7BOg==
X-Received: by 2002:a05:600c:870f:b0:43c:f00b:d581 with SMTP id 5b1f17b1804b1-43d43880eb4mr58784485e9.29.1742460916713;
        Thu, 20 Mar 2025 01:55:16 -0700 (PDT)
Received: from ?IPV6:2001:a61:1348:8f01:d3d3:1b29:8986:519c? ([2001:a61:1348:8f01:d3d3:1b29:8986:519c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f55c3dsm42191635e9.23.2025.03.20.01.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 01:55:16 -0700 (PDT)
Message-ID: <a34c5771-3103-4253-93d8-df5d4c4a8b1e@suse.com>
Date: Thu, 20 Mar 2025 09:55:15 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: use-after-free in drivers/net/usb/hso.c hso_serial_open()
To: Greg KH <gregkh@linuxfoundation.org>, rtm@csail.mit.edu
Cc: linux-usb@vger.kernel.org
References: <33193.1742406937@30-11-165.wireless.csail.mit.edu>
 <2025031933-clavicle-sulfide-878e@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2025031933-clavicle-sulfide-878e@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.03.25 00:49, Greg KH wrote:

> Wait, shouldn't we fail a device that has a zero size anyway in the USB
> core?  Is that a valid configuration?  It's been a long time since I dug
> into the spec for that...

Hi,

3.x has language that requires a minimum size of 1
2.0 does not. In fact it has language that can be read as allowing
a size of 0

I am afraid blocking this in core wouldn't be a good idea.

	Regards
		Oliver


