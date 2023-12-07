Return-Path: <linux-usb+bounces-3830-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A91CC808591
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 11:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 394FB281434
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 10:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324CB374E7;
	Thu,  7 Dec 2023 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="slc6L7LA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89EFB128
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 02:33:21 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bfa7f7093so617041e87.0
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 02:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701945200; x=1702550000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtvnOGwWaVIVLZJl01FFTM/jnDNkRfH72/dI2rop8EA=;
        b=slc6L7LAq3xFSOLdyIBiILmF6kMlsou+sWi6J/XtLZCpremZaaCO9fD7iluQfhGF+P
         8P+qZeigG1fU3bwuDaXxjQo/7iqdHgzd7FPUhNTXDDHJLv5nISm1TEBM/Z+8OwsI6BJo
         s9GbfxO9rYi0ebZmztzy6FzqZ6ZppQhGjlFVklJokuvuDoilMQxZc1cIcpFM1yoXRMJZ
         qVgvu5mGLon1bk89Otxjk9+sKc/vrbuP7ou1SbTW3PV8k7mY9n3YvwdX/udJN6LUPseM
         mS74FL+lDZWbHy8/sodHaW8xvY4L9UQQvG424/MJFESGOyYScUu3UKw4v3uYe/2Aa0K1
         DoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701945200; x=1702550000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtvnOGwWaVIVLZJl01FFTM/jnDNkRfH72/dI2rop8EA=;
        b=MyOgv5BdeiskEuTEcujo7h4CkmwCZyrbJKfWtdjr1BaoTmBEe4+xynLWLOSXTSbX5v
         NvwvjSb0HfzHARkvlgQXhwGtpgDINf27NlynBDmDCbEp3Z2EVz8RoJb8DFBPSrI8yK52
         JryvrgLYlWMjIcjB2dsFr+qcLc0vmwhaGntpSpI6Y0hb4+qjSl8Qj6N4/TZRdsujj5gi
         zqhN64sET3ucCaygLv8w4kAwk3x9ZRim4hmlonVjVQje7rs0YBAeIu5xPb3n/u21us7x
         sojKQcxjAh0TKEJVGDKGtr7FjTRIKpzGAK24R710HlS0Opm7Gn7DH794A2zQsoUoueQj
         GWCQ==
X-Gm-Message-State: AOJu0Yy/YG4Q7n6XnDrRs5DqtZO3yQUwdu0EBIUCvNXhSPkAklhXp/xb
	vhYVqKTlgXogsDBzautJyNhIfg==
X-Google-Smtp-Source: AGHT+IGSMWWakZ98zfiQ4cPt4yvm/RbUov0IOgNHxy9Y4PELxlYrrQBKHwhxpK9eEMyi4LcWGo/Fhw==
X-Received: by 2002:ac2:495d:0:b0:50b:f4f9:75cf with SMTP id o29-20020ac2495d000000b0050bf4f975cfmr1424840lfi.9.1701945199891;
        Thu, 07 Dec 2023 02:33:19 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id o17-20020ac24bd1000000b0050c19506428sm138326lfq.170.2023.12.07.02.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 02:33:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux@roeck-us.net,
	neil.armstrong@linaro.org,
	bryan.odonoghue@linaro.org,
	linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	patches@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/3] A few fixes for transparent bridge support
Date: Thu,  7 Dec 2023 12:33:16 +0200
Message-ID: <170194519137.470483.63867654987574718.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
References: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 05 Dec 2023 13:13:33 -0700, Nathan Chancellor wrote:
> This series fixes two Kconfig issues that I noticed with the selection
> of CONFIG_DRM_AUX{,_HPD}_BRIDGE along with a fix for a sparse report
> that I noticed while seeing if these had already been resolved.
> 

Applied to drm-misc-next, thanks!

[1/3] usb: typec: nb7vpq904m: Only select DRM_AUX_BRIDGE with OF
      commit: 5908cbe82ef77f6019349c450d7f1c8b3c29bb0e
[2/3] usb: typec: qcom-pmic-typec: Only select DRM_AUX_HPD_BRIDGE with OF
      commit: 03c0343bdf8d43fee6dfe92a7b66308b60e9e77c
[3/3] drm/bridge: Return NULL instead of plain 0 in drm_dp_hpd_bridge_register() stub
      commit: 812cc1da7ffd9e178ef66b8a22113be10fba466c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

