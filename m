Return-Path: <linux-usb+bounces-2145-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F4C7D5B86
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 21:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B874C1C20C8A
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 19:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117213D382;
	Tue, 24 Oct 2023 19:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2492227ED2;
	Tue, 24 Oct 2023 19:34:09 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C53D10DA;
	Tue, 24 Oct 2023 12:34:08 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6ce2c71c61fso2903003a34.1;
        Tue, 24 Oct 2023 12:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698176047; x=1698780847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEvk4THNhAVnYNssVruy5oIOt2OcyG6oUAQ19IBkZyk=;
        b=Vj4gLCxRMG5YYYtk6xXJ/+0UicdbrItqMMrYnxrhQ5JAQg8BlpaBabB8W7RXkTkgUR
         UPfDXd+MP6FuAYVi3+S9efIO5pXdK82YQvKU/hW6AnOrN+fcWDjN0tTEkezp+Ta7MM8P
         +ZU+1xSGa15a8bDWI+p/B3rlr1+FM09/4nY52ss7+EhMUA3Fdfxfd59UoRUlJz/OO5sT
         adcsCNzweDdS9d7dy5/kecL9OxFp1OM2qRZoxzZsQdsSlobHv8i3MahNkscA2D2NiALr
         3FbJmLNm2PVv5xgBbD+9oktNeRUMRU6OQRDuOa8GER17xC9DVzt1pPgPDNhsz5PRjNxx
         ObCA==
X-Gm-Message-State: AOJu0Yw9+YktdasYVkc5Bi5QSOQiOEaEVm0ipX1hkNgZ89KyU3tCMWgh
	7Prifz/RImtZRZ3DYkjj2A==
X-Google-Smtp-Source: AGHT+IE/D4pFNKTrDIzKXf08TJS0pbhvTukMC0upbfWG2caKaiSl0A3HnpKNq3MT/iuTQ5vyPB4u8Q==
X-Received: by 2002:a05:6830:2058:b0:6b9:d224:1a1d with SMTP id f24-20020a056830205800b006b9d2241a1dmr11080588otp.19.1698176047284;
        Tue, 24 Oct 2023 12:34:07 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s15-20020a056830124f00b006c4727812fdsm1964537otp.15.2023.10.24.12.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 12:34:06 -0700 (PDT)
Received: (nullmailer pid 431352 invoked by uid 1000);
	Tue, 24 Oct 2023 19:34:05 -0000
Date: Tue, 24 Oct 2023 14:34:05 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, ~postmarketos/upstreaming@lists.sr.ht, Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: usb: fsa4480: Add compatible for
 OCP96011
Message-ID: <169817604506.431304.9280516039903751308.robh@kernel.org>
References: <20231020-fsa4480-swap-v2-0-9a7f9bb59873@fairphone.com>
 <20231020-fsa4480-swap-v2-3-9a7f9bb59873@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020-fsa4480-swap-v2-3-9a7f9bb59873@fairphone.com>


On Fri, 20 Oct 2023 11:33:20 +0200, Luca Weiss wrote:
> The Orient-Chip OCP96011 is generally compatible with the FSA4480, add a
> compatible for it with the fallback on fsa4480.
> 
> However the AUX/SBU connections are expected to be swapped compared to
> FSA4480, so document this in the data-lanes description.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


