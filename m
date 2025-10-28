Return-Path: <linux-usb+bounces-29796-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCCBC15880
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 16:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B8D31A27147
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 15:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C017733FE0A;
	Tue, 28 Oct 2025 15:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DBb9rYMJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A55342C9D
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665872; cv=none; b=RRc2hK3qm9QMkgimnnJ97jKXYBz621h8YQEyVsRgbCU1nPAvizyFFQZKYDVtqTGUQnc3GcKHXJZxdJfSIIWqfuXU4zQo2B6RUc+BdfkyeX1515sSfQx0U581wW/3Yqt16GaKz+bP1RDL3AtcmWE7y77TnKVrMtfl9cxVIo1G8MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665872; c=relaxed/simple;
	bh=hkxftgZogT+NrML8v/Ks/KEOR/YUZS/UiQYNzdbP+u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zi5wDyoo9ubfdWEQKcO4AZC7P2mDNtabOVwT218VX3glVG8bF3V73yubBFbnWlkGJeekEXQNBoOpZl51kj8gQNcl4Wn6GXpL7Z0xeiSX4pZGTRovSHKru1uHi/N6G0hYSDvle52cD9QI2S3ZXPMCnsmKy/vl5a3jk8rUhS/GJNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DBb9rYMJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-471b80b994bso85013305e9.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 08:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761665867; x=1762270667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ary74Q16PuhBPSjsrWRBA9VPLl5HYwYWAzTzc3x3IqM=;
        b=DBb9rYMJOXxlJyM+m6BXNSpELSoEt/nChqopUq4uC9Qadq1AyVYSyD4fQzarAxmENl
         0BTDuCvadpxWY/wlwJswFHecSRbrAjnyy6b1WcxPi1QZxWNaTmfIOfc36mG3l/FvMIfC
         aKcue7BmGO5Lhq/IBOeqU4miqQ7kQPUCYU63jMzH5wHYb9AGhSTIr+EPqwHLaWZQTz+D
         9oqXgtmnbbI7OhS/TDebd4m5oExs+4i6ZLzxLEZOXy7b5LI396sx/XWOi55epWEL71ff
         d7N0qzLayvzWatOPMQPfI0Sow4PN4aMRKZ3SJp9G732hpBb/PR1TsJE0+yAFu6JOUf9c
         1BLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665867; x=1762270667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ary74Q16PuhBPSjsrWRBA9VPLl5HYwYWAzTzc3x3IqM=;
        b=J6Sj7y+66uGBYtLhYn19+tlo9h5UWmRhmF+/ueeli7LP6Hq0m1ce02H8w0kXUffqW7
         t2YoaJ0QpY+pOkfg0Hx59Z4kednx2jxt2sfHS/87aZ+DBDMmQk9vBAyQ9aLPIa/fnm/U
         Zpfzjd2OOE/09FsneIHU51wNgxTxc5zLBVG86MEJTLhfCMTo5/MjyEg+hVvZ0nGAiYXv
         c+B/Nk8ZqjaQXDP/sENLYmFpPfT0MTr40Yrlv83F+IBSF48uqFSDAJSxfjSyaPJRjIWS
         m81SF7E97wXVAZiUvgMFM1ii1izYiFF9MsFDprE4EgfsnfhQtVABBeMKBOkPhqhdJNcJ
         qWRg==
X-Forwarded-Encrypted: i=1; AJvYcCXlDdIfLxhEvK226rCElvxZSHORFCjzxJ7vfW+SltKg4mAkj1B49A5LCefG5dp4QV4wIy8NGth+1UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXk7R81w/GiE9RgYRAXVI8n2AsLX5PWuVbaJcIFQLGLkDCNVPW
	r4KLYTBPxMVUWnUpgMR685Sy2RQLFALVnQZp2OQYVFWNvW22SqkfXHZjanL2ekjxpxE=
X-Gm-Gg: ASbGncvlu9IQZxePgASDp2vR3FA6SVZix0D+8soUZCBQZHtLAfnCQsWx38pmwoE5g1V
	zf9e6c+AKLz9YnXX/jiBoALMHNj7f19Ww08gRXbpy/2KBP7Ln6UaG++IEYQ141gshHQXmwGRKoL
	IkfXWtx3mA8I3eXCTTP4uFGE2mSIFsvOjD+2Aod6r9pHuSWNlh1CY+YX3BlmLGvyuLB2jmEMKqP
	qBA2hW7yIpcKAsq8mVTSAiXAlKW3TMexdBPtZ/RyYg/TMuG3Qt5dW90v+mCh+1w/1JcOfmsZBMN
	GgDllOcan0odV1ZdjS2Cp8gDHUZR3A83ekT2Lo4FU7kJeHF7wHBPlKqf/ui6VDtjC/9T+nyprk9
	yozKUZoOO7S5Kf4oFeYAOT75byrDAxDBjEcOrmRfIkEeVjdkv58zherLAaHwoEp6epd2Z1KwY11
	Bua/x5o/Q=
X-Google-Smtp-Source: AGHT+IGa5T0vOPwrqxsDiAUoacPyZz4CzqIzpe6EkXzz80SQCdnOeksixDrdaFnDHHVah/KpxoMYOw==
X-Received: by 2002:a05:600c:6304:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-47717dff4cfmr30922465e9.12.1761665867365;
        Tue, 28 Oct 2025 08:37:47 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df3c7sm20595813f8f.40.2025.10.28.08.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:37:46 -0700 (PDT)
Date: Tue, 28 Oct 2025 17:37:45 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Skip setting orientation for UCSI
 version 2.0 and above
Message-ID: <jworx6dkoykwimfn7b3wlatgvk6engrbzyuhzsqbgjivlpicjw@xg2aenqcwkmz>
References: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
 <a4f3yhhz5sntno6gnfbjnjjsbtyo2e4y3da2aywsg36gvxkaxg@vw2vryukrepl>
 <xboq73zw752odclybviqnl75pp2nl2eamdvcdv2idqljck7qvu@zdh6ny7nja3w>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xboq73zw752odclybviqnl75pp2nl2eamdvcdv2idqljck7qvu@zdh6ny7nja3w>

On 25-10-28 17:30:37, Dmitry Baryshkov wrote:
> On Tue, Oct 28, 2025 at 05:19:58PM +0200, Abel Vesa wrote:
> > On 25-10-28 16:39:19, Abel Vesa wrote:
> > > In case of UCSI version 2.0 and above, if the orientation is set from
> > > glink as well, it will trigger the consumers along the graph (PHYs,
> > > repeaters and so on) to reconfigure a second time. This might break
> > > the consumer drivers which aren't currently implemented to drop the
> > > second request of setting the same orientation.
> > > 
> > > So lets leave the orientation setting to the UCSI generic implementation
> > > for all platform that implement UCSI spec 2.0 and above.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > 
> > Ignore this one please, as it is incomplete.
> > 
> > We need to also set the orientation_aware in pmic_glink_ucsi_update_connector()
> > if the ucsi version is at least 2.0.
> 
> Note, I think it should be set in the core rather than setting it in the
> driver.

Yep. I agree.

That's what I'm doing next.

So ignore my earlier comment. :-)

