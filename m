Return-Path: <linux-usb+bounces-28760-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3F5BA835C
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 09:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A8523B8215
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 07:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8448F2BEC42;
	Mon, 29 Sep 2025 07:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFQ8Q31n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650A417597
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 07:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759129358; cv=none; b=W9ZKEMD/zgOlTWbdRWp6HzdS36xa2RgT7zhlWSasCzveMulGANp8N1p2+pzJJmqBzgyByqjwJYfthijvrkRWCwa/d+UQk6yXik7UX2ApqKWJGkM7rvJF0aoBG5gLBedArMQo2tWr2dwHXW0P4gevV7CStqRsXQ5WGykUAejNFJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759129358; c=relaxed/simple;
	bh=CFa2o+Qi7bcL/SyPD0GyO6/ru0OqQo4csLh4goJ0HJs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JbrIXXneqkxXBH1oZFruHQmZgrDb6TubkpBNnC9FJPv4/Ro8ENsI29bbIhd58eB77xXQuqdV6Ots0MFqmXqrpw45D8hVSm2BccTwbZw5YLq+Eeo5ndPLeJOFe/VuQu7qvvBiCOP3ZFnyPI5RuRADej6gc7gJQkjVBDKprypjA8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFQ8Q31n; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5081695e87.3
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 00:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759129354; x=1759734154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+idRAXHi7Bt2G/h4yU81t4RO8kpF2kCatHGuxrQQntI=;
        b=MFQ8Q31n17Uu3Crsw4B3wmMhprihatGi1DC7+6RUI4MLg3RbukZnlBLk612aSrM/VD
         L0w6BCE8lHELjdDRcNJ7N2O8TdLwbHmTCUqiH9I9KcCpq3D413Yb3c0O9dWJ/qIp9oVq
         5qjECDeuAjTNZji7bJpk3vAzn0JFcI3w8pVJW0BIJiXFQ5Zw3sfcPSYEvN4SgBKCFNwD
         8oS6/ut7sooBc1PlWXWc40B4jgTzJO7CNX2bA9wcMP6hK2bJR2QEEcByX1cUAV7catmI
         6KNxQrYxSuaUP3lzG1z/BRkSDQc6kYMGW/GSCncxJs+JbfPr9CUWygdcj3FQUHKp+QK9
         J+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759129354; x=1759734154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+idRAXHi7Bt2G/h4yU81t4RO8kpF2kCatHGuxrQQntI=;
        b=eevSSA+G3aM0LEU2g9t/0NRwiOFiTE2UY25/CoeBW/QW652C7UuxDbz3E4tFQ1HDAS
         4jopQwuF7jZCHI/QB9JU59MdFjRGflXE41NAiwD3Gl1YMhphijY8cG9LXVMZ9EC7GoNI
         5qYXYFP2sMnyNX2lDP1jEtFXaurFiGnP+R/o2W4/KBIwn9xOlzaJ9Hrj0zWsOmsWR40j
         xcJcwLtZjISWtNl+bhXUgSZwcQ/8dVfLjn2udPow9J75wacVOt94nBF4enXdpf6zJ0pp
         2MMyq1wifDec821UX4TVePhdsBEcsqM0+0UgBa1Iz+ROOZmbZp9h8FBjc7tNBUGf6AIt
         HRkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV4okn3NQh1gTuZwzVh0ud7navyo/Czm6xJ3GV87YSQpwXeYg9dbzv2XsjOf3goDUJG5KRVp2SX0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGpyKbh8bGXmaEB3VEsi1Aw1HepOFEwfAbYTV0bY2xeyYwf0u3
	Q75pUxbYKAu+yQm2otMPQFiXv084Y0xMCWMy0Ij8yjdCG0Mp4cKKDRuC
X-Gm-Gg: ASbGnctRdZ5u+bZlT+x+G3Op/69sNJ2WChSgg4KBrPvWk/a9QvGkgo6/z1dvJLlYZ55
	yJoQe/ZJug24PgWvEj3YGelHQqQIrc9btIqYeWrVTNKrriM2FsDNJHgO6CxdtYl0dw2PJW+QUsx
	wHDv9L1ZYBvOx9mvmp4whEWrQ7MA5aFhwV73s2WMV09lEcSYttbTphbM0oIlTVTj2biukGoSvqm
	nc35EY+5ihF/bbwpzO9qeQwa/7LfnK+egoyZTpDITYmEP1mhL7lZ95ygV25F0Ix0rNSXi8uQsxV
	Rd1nq+xUSdhZlcETK5/aN1zHJzeQm4sFn0SsvVpqVU0e1pqVqP18W2d8YJOLQzBK+CdIDFwM/kl
	fN5m0W3qHs8WnKW1A2Fh84V7YwAyOsYldwXQWsks66nFLuUpwhA==
X-Google-Smtp-Source: AGHT+IFPtrPQZPiy1ca2nxjQmwhnlaRMgJecjRwG32UKoNgKoyGvorgS/CknEXOO1FbjA770ZE+WNQ==
X-Received: by 2002:a05:6512:b1c:b0:57a:c67b:beda with SMTP id 2adb3069b0e04-582d12f13a9mr5332385e87.16.1759129353877;
        Mon, 29 Sep 2025 00:02:33 -0700 (PDT)
Received: from foxbook (bfe191.neoplus.adsl.tpnet.pl. [83.28.42.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58671254012sm1430460e87.62.2025.09.29.00.02.31
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 29 Sep 2025 00:02:32 -0700 (PDT)
Date: Mon, 29 Sep 2025 09:02:29 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: yicongsrfy@163.com
Cc: oneukum@suse.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, marcan@marcan.st, pabeni@redhat.com,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org, yicong@kylinos.cn
Subject: Re: [PATCH v2 1/3] Revert "net: usb: ax88179_178a: Bind only to
 vendor-specific interface"
Message-ID: <20250929090229.2fa33931.michal.pecio@gmail.com>
In-Reply-To: <20250929053145.3113394-2-yicongsrfy@163.com>
References: <20250928212351.3b5828c2@kernel.org>
	<20250929053145.3113394-1-yicongsrfy@163.com>
	<20250929053145.3113394-2-yicongsrfy@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Sep 2025 13:31:43 +0800, yicongsrfy@163.com wrote:
> From: Yi Cong <yicong@kylinos.cn>
> 
> This reverts commit c67cc4315a8e605ec875bd3a1210a549e3562ddc.
> 
> Currently, in the Linux kernel, USB NIC with ASIX chips use the cdc_ncm
> driver.

Only those with a CDC configuration. Mine doesn't have any.

> However, this driver lacks functionality and performs worse than
> the vendor's proprietary driver.

Is this reason to revert a commit which prevents the vendor driver
binding to CDC or other unwanted interfaces?

The original commit assumed that the vendor driver will never need
to bind to them. What has changed?

Isn't it a regression?

Regards,
Michal

