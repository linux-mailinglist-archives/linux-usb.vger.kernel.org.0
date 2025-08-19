Return-Path: <linux-usb+bounces-27005-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECD2B2B9BE
	for <lists+linux-usb@lfdr.de>; Tue, 19 Aug 2025 08:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1E3716A60F
	for <lists+linux-usb@lfdr.de>; Tue, 19 Aug 2025 06:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADFA26B749;
	Tue, 19 Aug 2025 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvqDjER/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4594124E4A8
	for <linux-usb@vger.kernel.org>; Tue, 19 Aug 2025 06:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755585722; cv=none; b=cUKLAjKrnJDC1DILfsaahhJfkVyY6xGCNd1A1hEh5B7mIen1p5n491JCXaOkvgDDHuieeUbxciBqtcgt0+Ltd2+OirmlGKQB5IUkjuaT/ula/S/qpUIRav5cLXI2NvIHoGPWxy3DEM7hNEb/GG8fsVPtQ9ouSm79RzncvlJAA4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755585722; c=relaxed/simple;
	bh=oVhaykn237IE+sSiBFfDEYwLqYIDFYBWIbK7aE36V9M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RCMiNMNHI/ShnaMYURYXyj2WHJMMsQKZrghCpbI98yh5JVd7toiCPbcrCOkoFHy1tyl5Ucz4XtY75eQCILVQ+Kf/J2gNFhbQr4i5K3we3QUBjGTn9ksFH1U5/S3eD3zOJ52b46SdS5imle+4s2NiQ1yJxb85+au1PiwMdZNuFtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvqDjER/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55ce521e3f4so5281112e87.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 23:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755585719; x=1756190519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tl1eWlrDoTfqkIw6nCylIiO1PeyzsPYE6IbWS+8BGLU=;
        b=JvqDjER/tm5J+AdSTX69+ES2hPFuChz8uqE4kCfPJGk6MMWuPImy+RhFKG7KWur0d/
         M/j9kfZQ0xLpnrsGEp4W5WJ0W+QPsrTjmVhDyJ+rTnOOoOtj287Kp461IOEBpqxBMOnJ
         r0Ob80FhEBsxYU/0zSLLS5MYahPJLWYwwc6FDAjjVe4/vjrrhipcuCRrGIHJkNconawJ
         t+nWw3J/8ojapR28vjCcgJK1P6XOowrEon3z5qN5jEeimhbE60ljWytJO8BDNrZkOg6y
         2mRzsiMVwfY+/TEguLrjQMBsrvD2hPapqcID5UzBslT1+9NZOxvLQfblq3qvjL78z7cu
         uZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585719; x=1756190519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tl1eWlrDoTfqkIw6nCylIiO1PeyzsPYE6IbWS+8BGLU=;
        b=ZZqeNxoL/5Xl36tw/YI09M0c12m2ShRRf8U8U5FjFL5fcQJpgJS3caPW2JtqUiqZGU
         iJalxS4EnSaHUSFTZgHRdGQSOiXlBBTulGCmuYmA76q7IVBpBU3sN3yCK5iXJ0/tqMFL
         yrX0pnD9myXS6422YbR59NnYZTYmQOWjb0HFdHjEbNnuHxKdFUB8A4SMCyIvGx4PLkpq
         A09zTFU4qQ8LajQH/Uf4JGjVcC9juFXGuG3dvEKjq1jiBxpSXwGI7G5C6DHgjctj31vr
         s4MfyDr+Q4C5MKEqcExTcqHTVWz1Wv+xz795Z8F+qCJ+nPygPkJUql8yL/4+/BngDWaf
         5yPw==
X-Forwarded-Encrypted: i=1; AJvYcCWuofyCidgYtf2JkRQdrPbveJtRH3tAQzOXW/u5dwguG8nXXjwZ6st1LaG0ICa3TfZGNyXfllDDr1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUY2BhNXary4Tf1vN4p8UGfZSeGf8MlR176L1JCMrJYkJpP+Gv
	iOcHxfxNGn1WSk2odvV4gFIpa6/5JDsImt1eIjd0BLoHRaQLfc+Kj1PSgUhY1g==
X-Gm-Gg: ASbGncuKQlJFLwrv/xCLPiCb8xOO5Cd+7YW4o7tcwftoTOlctRaYcEafjxlXclYqvqK
	fLfsOekfpDyXgz/WzfHvoCgcsyOyj6JmPnzwtClI8jIzSaURsi2OKc2khv3BUDQhvSCBu2fOfpo
	aCpHMY2x2SJeWC81SC82/dsl5u9bhC8I6QTMnCT5ioU9BYE3fmnQ/XTSireNIySnS5KGKEgpWTg
	SnPYkGvGVxHos2uzacLBtAKAv/vjbz/d+NTvd+JyLH6YXD3eTcp1go+JWXxcboRkJlLjOdB3dMR
	a8J5f0QfKp2px2D2di4YfBLwZH0sSiCuOiT1enh306ipem/qQtbmPRJsfqfUe15HXE/MJJcLv2l
	Rg0R6MzQzTMoQ4UPjq/LR87mupIHmJGkN3AUTWwFbUMOY8w==
X-Google-Smtp-Source: AGHT+IEElzTmBQKi8y9DVbV2R/gzGMxaQnK47ySW6v4/t+YPC/5YcZqI+tsKnlyL5G03VhAKgKe1FA==
X-Received: by 2002:a05:6512:b99:b0:55b:8f02:c9e1 with SMTP id 2adb3069b0e04-55e007aa96dmr430802e87.27.1755585718981;
        Mon, 18 Aug 2025 23:41:58 -0700 (PDT)
Received: from foxbook (bfd208.neoplus.adsl.tpnet.pl. [83.28.41.208])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a41ded8sm22906461fa.4.2025.08.18.23.41.57
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 18 Aug 2025 23:41:58 -0700 (PDT)
Date: Tue, 19 Aug 2025 08:41:53 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 regressions@lists.linux.dev, Christian Heusel <christian@heusel.eu>
Subject: Re: [REGRESSION 6.16] xHCI host not responding to stop endpoint
 command after suspend and resume
Message-ID: <20250819084153.2c13c187@foxbook>
In-Reply-To: <20250818231103.672ec7ed@foxbook>
References: <20250818231103.672ec7ed@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Aug 2025 23:11:03 +0200, Micha=C5=82 Pecio wrote:
> A bisect effort is ongoing and c0c9379f235d ("Merge tag 'usb-6.16-rc1'
> of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb") is bad,
> so that's where the bug likely came from.

Looks like the result is in.

e1db856bd28891d70008880d7f1d3b8d1ea948fd is the first bad commit
commit e1db856bd28891d70008880d7f1d3b8d1ea948fd
Author: Niklas Neronin <niklas.neronin@linux.intel.com>
Date:   Thu May 15 16:56:14 2025 +0300

    usb: xhci: remove '0' write to write-1-to-clear register

