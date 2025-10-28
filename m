Return-Path: <linux-usb+bounces-29798-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 797C7C159A9
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 16:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3362188724B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 15:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50319346E77;
	Tue, 28 Oct 2025 15:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aI7T47Jt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FC8340DBB
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 15:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666276; cv=none; b=Czy2kyV/xAC3FTRYjxwOpCIHNXkmY+P+KDb8d2vfM+M26DcE3zS7Ck1i3PgBYlSNdybwLlaWzOL3cv7KN1gR/shJmWMboCcD0w7JwNXeiBfoxcJDdMye7zi4Q3ZIvJrlaPJ1FCms6UaaStsd3C7nF8qRwYCdxWr/GIEFoVBOyE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666276; c=relaxed/simple;
	bh=ZeWbW3cwFzTk+snUQ1YZru5uS3rdocJhJhmNIAkZTos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0hryywJRA8VMRO5J8QIHGYWgNhiWT9fyshwlsQDiWDcFnHuhOhq5SXs45TQ2pCNU5v5z2kvYE/LpLrzrk6p9TJOUNbAT7qDyRsIqTJmJaJUu/AWZWGKOVjORH+VE2Wsv+DOsBf+YuiYsNCea5jjV1RiRkJLVZWgw8DWnMrDl8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aI7T47Jt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47114a40161so69284335e9.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 08:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761666273; x=1762271073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kxDtTm5Uk2GlvziLH671chbdmWE90Ft/hZE2+B8F9lE=;
        b=aI7T47JtgV8TEWD/on7n8AyrcVYxh7MD90BkXCGHPwbX8pP9tco9CL9WLzg1OHL7oP
         tv2EJLkXIeyd0dOt/OPaKBdXNVMsWvHEniGMRW48UCQNhTb/uzeAU38E9IaPrO3mG4I2
         g1O5OyohVFvNP58oNm/1HTkjNPQ+y3MINs5iDd6xP4yr0dCP4+Mwt3jSpmPoeqOQuRWR
         JivNwjGapCJeckXJfpXrBt95VUiQ+mj5/sDlroucvAFSjvqPg+DdjcqfKFy6N17S/f6r
         UwqJL5ZjXzjZaE+9hOFTv0vpBv117p8+WOTtEnsVdm9tLKBNmpTT77wa2Y8Go2NdWWqt
         0DzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666273; x=1762271073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxDtTm5Uk2GlvziLH671chbdmWE90Ft/hZE2+B8F9lE=;
        b=UPoVJCGUjtyVgatAEMR72m0CJQXlKsndDvSGaG/jSrhWT/WJ4p8qsgMjIlqTMo0y4q
         ZPalbk2BV61ZZLhIStE5c/86NDAD+Lo6VEkPUpbjtfjn4iu/vTtE76ClBLviJufIe43T
         as320Ori4cekgbTi4X5uhOXxnhTOiHM/XowOWhhQXuN2nBWFnZ7XlxMmN3L5d+1Qi+Vw
         YvZbc9hCs60s+qZuQ5F9YXTcn/Yn52F9VqVa80yPMZ2rKuMEr5PVp+aGSqrkV8l5qUMF
         mIooeoimf7rk4VwgqBXegLF6epqWqvxxYIWkFbEncbtotR2c/09bo5rNC8WEfCehnwhV
         ZLCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjaKudXrz7ky2q1WrlNXjxJfjXyy6eDw1fa3fr9XddEjEn/geAGCNg3FJheiDlqC6fWRQxXT6tKz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZfhPCnTDtl1e6FcZxX0ETSgUqnqFV3nClrJUdSZYDeyCWepUg
	0+A+KjIUlkgcjQaSj5LSgprNhfNyiVXfeNT5d3Hi8FEXM+dkyA27QCnsnrv5J21Jh3w=
X-Gm-Gg: ASbGncskuPfDTuz5mZSwZHt6uQBYRXc5oJDT87SuEi9dqc9u5YS1Bwp/ExsSIiwvgC7
	OBPxB65GDxdRFlHipYLyMqEdiWLh0H1QZjzBgd98skGL4yrJ62AUqI+DSgySElTszaPjXRtnu+U
	TM2AHs1FHM87fiEdHLzOLdm6oTSICO+wxjc0GuAh1EXQZ7/CZkYchJ319InDrOk3jiuIKG9iddT
	YNjJbqDwLUKAt0Yvz9P0O2Rg8yq2bGLtMgJg9JnIsNVghUAUMwL0GF362nGDGgUyVD8mQ/11W8X
	cdFHNCZSWlk3cp8K02xE+l+YlJMlaSBsaoej2CsE9fY0oRF4n9reYdN523ydVA4BfR+fMmZ6zad
	0UiDVSwhEn4DmZzvkecof4OBS2s4dpP9XVQQO6ukuClBAGNpaGC9+Biqe0gVYZQp8FwQqpgAl
X-Google-Smtp-Source: AGHT+IFaU/N5jEahD1Hr0mgcuydBUovhHsTFqREepEo8khWPEdTWoHTHChqz2NMEQuQxs+evxhHULw==
X-Received: by 2002:a05:600c:46c4:b0:46e:46c7:b79a with SMTP id 5b1f17b1804b1-47717df4dd5mr41181545e9.2.1761666273275;
        Tue, 28 Oct 2025 08:44:33 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd374e4esm195344815e9.11.2025.10.28.08.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:44:32 -0700 (PDT)
Date: Tue, 28 Oct 2025 17:44:31 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Skip setting orientation for UCSI
 version 2.0 and above
Message-ID: <ikwmc2pigfq3pagcetssxkl3u27ozucrwku2f64qd5hvaonna7@3dj6s24dc7e3>
References: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
 <a4f3yhhz5sntno6gnfbjnjjsbtyo2e4y3da2aywsg36gvxkaxg@vw2vryukrepl>
 <xboq73zw752odclybviqnl75pp2nl2eamdvcdv2idqljck7qvu@zdh6ny7nja3w>
 <jworx6dkoykwimfn7b3wlatgvk6engrbzyuhzsqbgjivlpicjw@xg2aenqcwkmz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jworx6dkoykwimfn7b3wlatgvk6engrbzyuhzsqbgjivlpicjw@xg2aenqcwkmz>

On 25-10-28 17:37:45, Abel Vesa wrote:
> On 25-10-28 17:30:37, Dmitry Baryshkov wrote:
> > On Tue, Oct 28, 2025 at 05:19:58PM +0200, Abel Vesa wrote:
> > > On 25-10-28 16:39:19, Abel Vesa wrote:
> > > > In case of UCSI version 2.0 and above, if the orientation is set from
> > > > glink as well, it will trigger the consumers along the graph (PHYs,
> > > > repeaters and so on) to reconfigure a second time. This might break
> > > > the consumer drivers which aren't currently implemented to drop the
> > > > second request of setting the same orientation.
> > > > 
> > > > So lets leave the orientation setting to the UCSI generic implementation
> > > > for all platform that implement UCSI spec 2.0 and above.
> > > > 
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > 
> > > Ignore this one please, as it is incomplete.
> > > 
> > > We need to also set the orientation_aware in pmic_glink_ucsi_update_connector()
> > > if the ucsi version is at least 2.0.
> > 
> > Note, I think it should be set in the core rather than setting it in the
> > driver.
> 
> Yep. I agree.
> 
> That's what I'm doing next.

There you go:

https://lore.kernel.org/r/20251028-b4-ucsi-set-orientation-aware-on-version-2-and-above-v1-1-d3425f5679af@linaro.org

