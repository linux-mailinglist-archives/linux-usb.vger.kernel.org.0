Return-Path: <linux-usb+bounces-31802-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EACF0CE7D21
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 19:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2FDE300FFAD
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 18:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6826127FD7C;
	Mon, 29 Dec 2025 18:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bj/b7F4N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C9732FA18
	for <linux-usb@vger.kernel.org>; Mon, 29 Dec 2025 18:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033238; cv=none; b=SQG75mNcyv6f8HF/M4PuR+o8M4C+N6rICPIHK55s/PClE/EgdxqD64f/WowgS2mVtPMQh6QbiC46Q3cqwWR69P8kk3ZBlk1ePpCwUfgyR2n7EFvOwqU1JMYhKgtMnDfFwiOiQ6hDldrrrl2+eJ/f49DlfcLJxStMWuLx3GXdCjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033238; c=relaxed/simple;
	bh=+21vXwmXJAEwk44gixVVoCMou1vEFFG+9TEW7F2Necs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=K1tMfvOmD90naUdlQKbr5fwfs5W1swz3og/6MjmXhBRwLAh4WY2BAEApRe7Nr/rD8AEvFv2/iwS1x0Huoe0ujEF2N5sbQWdaW7fbvYo6nXAaQPj0N5JAepmDrObSVEGUpOB6tCMfhmSHF5IZ/yqp+Vl/8d8HBY4jcBsuexPiHow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bj/b7F4N; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso96136305e9.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Dec 2025 10:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767033230; x=1767638030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7z0B2zhXV5zpvQStdwY3VXDDhET9zl4MmKoAwZgoFbY=;
        b=bj/b7F4NLg8UioyTWUQrN6BXhaOmo3+p0tT5Zbb8fCkOB/92+0QLGDEBy9cJ3l9BEu
         Nd/qDp1Z5oY1xQeI1RrAhwkjOUrFSyF82AVJNBk3DNhaDs5ywlFfoXO491/JXIU/1zFs
         nU4vMpmcRHN2fnb8CzF4c0ORtDE0E+2jXgfP236Es4i6QX+3ZAYhllcA18U3P0N4kI8G
         O2Bl+NPxfPiMYL45XmWdS/a9Xryo6UFn4bGwicmxlgNT6s0EYYLa8ZZy5/CpTP/+BEWz
         0QVPaW/0GxJVIPSmkz0OhGYaCZA25/o7c9TswMSUBDN7x9eQ9xoOfVpopX1MKP+rvlNr
         8SCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033230; x=1767638030;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7z0B2zhXV5zpvQStdwY3VXDDhET9zl4MmKoAwZgoFbY=;
        b=arPJv8I6k6MzINcK/sEN5EAh69EzVV5kZweABwg8T9EFeZD1E8Ng1bqJBEpE+LgV1z
         a+tZAfMtm9V0Cy642zyANjLs1d6BGsJ4sRFZ7zXds8RX4gfCEoDiP5VzeIQSVlTxtTZW
         ++ozRFlXOJelraxFMc7VuxkY54379BZLyJ0yThpPjWE+p0/gvVAzhv/7eDDKRns6K+1d
         T3YY2YJXkFg0FeFQC93VQWjxa2fxgVWROrqM4qzKOFgz5q2Uwr81jrDGj11Tmf6mi2EY
         EB/HURhQZ1CLgCAzwCR0P4QjJiQUv5L2r93apU+tlnsbVAHl6bJEmt45V4kvhbYRXMqO
         WCXg==
X-Forwarded-Encrypted: i=1; AJvYcCUr9StBGrJWuowta0lmrLbRNizPDq350AysoFWfvgkE1qbBB+I3mGwUBvuPWXUmw8SRU/0fK9vk+eM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKvGrN5PYqYSSoDyT0VlM2kfUjKI5+JdmzL9ECL4VZQv3M0ANc
	d3ok6sQxbFeWssWGxKqK86ooT7TMSr+SB206Z7EnMGxFQxbwO8QlSes7eRlGQwAEo0w=
X-Gm-Gg: AY/fxX6OHCaWs5SAUdw5dF/GtaSPsEbiY7knx57jD9ywaKD1fAAl9YzeteebsTN5QEF
	UVwg9dMMyVxukCr0Q1ht3Ae3R2Vzvf1LoeMcA6+5QG+CM6qSW8IicbQsIrpwT8b3T9nAa4kXCTf
	p12QgYYIWmywXM+H6BehlUz+nMY0NUxE/f0i1OQaxFtzX8DrRRYjTQvbywhfg5Xjkxx/TUA4+o2
	s6ftaRe+qizrGBTljkLdZhP11dNLXOyZaAmjMh322nikcAs8VC8vvS1lg9lHho+LrbW7Dg/71eL
	PAndVefdKsAha5j/s97etdbKDZjiMUaUouAtz0fPWOSI/x7ErCNJe6AmPbP77QXOOnqQYbe4O3J
	qZIfzDdNOw3rrpQ673qrJuyHKtbXgdSghF8A13wg0xi8492lPTE8OI1PRH3cw5J0sQEA00ibKF7
	+MfSjqTCY5g9VvnqVm
X-Google-Smtp-Source: AGHT+IEHhrhFf7Jf8dL/0jQocV0GRaiwX1qkdAS5mCHJ5u+kHgrFmfG0sL3CPSPjggNXKCTNOgfCmg==
X-Received: by 2002:a05:600c:3b0e:b0:47b:deb9:fbc with SMTP id 5b1f17b1804b1-47d1955b7f4mr288107955e9.2.1767033229819;
        Mon, 29 Dec 2025 10:33:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm562809105e9.12.2025.12.29.10.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:33:49 -0800 (PST)
Date: Mon, 29 Dec 2025 21:33:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Svyatoslav Ryhel <clamor95@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: phy: tegra: use phy type directly
Message-ID: <202512262345.OOsbJ2kr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223094529.7202-2-clamor95@gmail.com>

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/usb-phy-tegra-use-phy-type-directly/20251223-175449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20251223094529.7202-2-clamor95%40gmail.com
patch subject: [PATCH v2 1/2] usb: phy: tegra: use phy type directly
config: arm-randconfig-r071-20251224 (https://download.01.org/0day-ci/archive/20251226/202512262345.OOsbJ2kr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512262345.OOsbJ2kr-lkp@intel.com/

smatch warnings:
drivers/usb/phy/phy-tegra-usb.c:857 tegra_usb_phy_power_off() error: uninitialized symbol 'err'.

vim +/err +857 drivers/usb/phy/phy-tegra-usb.c

1ba8216f0bc02a drivers/usb/phy/tegra_usb_phy.c Venu Byravarasu  2012-09-05  837  static int tegra_usb_phy_power_off(struct tegra_usb_phy *phy)
1ba8216f0bc02a drivers/usb/phy/tegra_usb_phy.c Venu Byravarasu  2012-09-05  838  {
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  839  	int err;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  840  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  841  	if (!phy->powered_on)
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  842  		return 0;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  843  
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  844  	switch (phy->phy_type) {
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  845  	case USBPHY_INTERFACE_MODE_UTMI:
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  846  		err = utmi_phy_power_off(phy);
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  847  		break;
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  848  
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  849  	case USBPHY_INTERFACE_MODE_ULPI:
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  850  		err = ulpi_phy_power_off(phy);
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  851  		break;
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  852  
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  853  	default:
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  854  		break;

err = -EINVAL?

156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  855  	}
156fbdcb2a09b8 drivers/usb/phy/phy-tegra-usb.c Svyatoslav Ryhel 2025-12-23  856  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06 @857  	if (err)
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  858  		return err;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  859  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  860  	phy->powered_on = false;
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  861  
18bd8bff69f7fb drivers/usb/phy/phy-tegra-usb.c Dmitry Osipenko  2020-01-06  862  	return 0;
1ba8216f0bc02a drivers/usb/phy/tegra_usb_phy.c Venu Byravarasu  2012-09-05  863  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


