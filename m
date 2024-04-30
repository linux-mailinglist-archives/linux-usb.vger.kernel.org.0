Return-Path: <linux-usb+bounces-9932-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E156A8B6B4E
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 09:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F13F1C21DB1
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 07:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D8B37719;
	Tue, 30 Apr 2024 07:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tP+u1jH8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8EC31A8F
	for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2024 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714461487; cv=none; b=anpQefTzWVfsVLg3vqDW97z/ZpuC0R/T8jAB4xr72d+LNx8rxNxSa5J/4eybqne9ISV4lsjRNtwZIiBgSwbFWbOFLg2EaEU1lIEFQHcWARY9BIDH1F2gE2LtBSrKuSxCRWTBHlIndzxVOXRmtp/osWnv8et0y9HhNrou+F6tNHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714461487; c=relaxed/simple;
	bh=gYjD/L9hhfN50Ps9Y9MHFLTnRz+JNZ4XvkTy/yEmsi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2L7budBBt69sfM8I9ocQrprKowKy6t6ALy2I/yh4XcHzQ1MNiIQ7gP7f0N4aayamSYvCDuS6ziKoXvBs+/XB6g6dbmW9TaRW8eMa0wb7TfJ54w57nXTrjqlTgd9axIHRggK5j/xU/zapTNQ5A6+BQF12u0GUpmglvW+0Txv2fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tP+u1jH8; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a58eb9a42d9so355411866b.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2024 00:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714461484; x=1715066284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0BPb7ImAff8lr+4NxPMpbVa+ZVOYDgWvOqFiGV9m05s=;
        b=tP+u1jH88wQgo4uYeE/NYc6b56PmOx0k4deajcWljYRGFvi8nMeh7CpSUZhBJ7LtUy
         fMCTFBZ6oeB66dqZW/NAmAHK4BM9s26QGxuvGUdWlKPSt3UNYnCm+PmeT7WYOfneb20B
         DACa4T0fOphSVNsx+U76eJTkpJqusHP8GGSAj5pDQNS2kSVl1FH/XW2uLTQbF85PXhSC
         Zoz13RQJqyh8nJm5Ftt7xLawrQOH45Q9hfGbcHhIEiuuj1sYl894WgNYsVmBbvhCogd0
         WPaD6VJvXjGUiTm1nC4m50Qc8PmEK1GkFd5JOg/e1a6nt7B3R8TXNLojvk7Y4JXs9Yz+
         vosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714461484; x=1715066284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BPb7ImAff8lr+4NxPMpbVa+ZVOYDgWvOqFiGV9m05s=;
        b=g0J9GUN0UZjBHSBx47FKUvmdAWi4j9gz0fOn0s44BbLoUKqN8WeAs843J8HA4LPvHN
         e/63vYBTrY+kcUYSLHDjptdGtpTdI7niu0ypAxKf2+p0oKNaWa7e6wM+kGg9BTuc4ZKZ
         +MRUfEoxvND6CXoDo0x9i4YyBeqjvDlIvUmedDDHyE5VOdFPmtn+2eInrGFkxVeVnS8N
         usCucg4eGpyiMTWKymFsP6wJtF5hUi8ZJZXtCQ+M6xXmzc1bmA+9UMdTygDauGTp2YAk
         SfAYvj014rZiWxYOTXna3A7jr9CypE6uJ4A7ij246kwUXax8i//03tU85vo80OtxEr8L
         HtKg==
X-Forwarded-Encrypted: i=1; AJvYcCXUcIOT4CXx0k2KBkot0vR86Byt+OgEAWmINMknURQLyNyRBdHTRR8XN0hZmEvYzC1aDULccOom8pEP8iHyIJz0GFIKeNuA+Fc8
X-Gm-Message-State: AOJu0YyiVTCNFdaG9dB6QfMfw7JTF8P2MsMbbBoZzz7KEJbCMiE4paxG
	CQAmLaEAOZdxgb7ai8PzykreALy9mvIk6gLca9UGMog6o6wcQ0TdnvB10a4fd88=
X-Google-Smtp-Source: AGHT+IG+O/XTMqMHGbpqGOnwmoixz0hzGXrkxyCkjoDOsOV96VRhtmo4H/tetmj5Fz4yK3hhi1Uvwg==
X-Received: by 2002:a17:907:334b:b0:a58:f1f3:626e with SMTP id yr11-20020a170907334b00b00a58f1f3626emr1104497ejb.56.1714461483594;
        Tue, 30 Apr 2024 00:18:03 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id f20-20020a17090624d400b00a5575cde7cdsm14423007ejb.220.2024.04.30.00.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 00:18:03 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:17:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	pmalani@chromium.org, bleung@google.com,
	abhishekpandit@chromium.org, andersson@kernel.org,
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com,
	gregkh@linuxfoundation.org, hdegoede@redhat.com,
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com,
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] usb: typec: ucsi: Fix null deref in trace
Message-ID: <32855f4c-f219-4396-81c3-42cbea9fe4da@moroto.mountain>
References: <20240424014821.4154159-1-jthies@google.com>
 <20240424014821.4154159-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424014821.4154159-2-jthies@google.com>

On Wed, Apr 24, 2024 at 01:48:18AM +0000, Jameson Thies wrote:
> From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> 
> ucsi_register_altmode checks IS_ERR on returned pointer and treats
> NULL as valid. This results in a null deref when
> trace_ucsi_register_altmode is called. Return an error from
> ucsi_register_displayport when it is not supported and register the
> altmode with typec_port_register_altmode.
> 
> Reviewed-by: Jameson Thies <jthies@google.com>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

This is not the correct way to fix this.  The normal thing to do would
be to add NULL checks.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/'

regards,
dan carpenter


