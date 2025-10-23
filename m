Return-Path: <linux-usb+bounces-29560-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AAABFF9E1
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 09:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9BC0A35ABE5
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 07:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645F02C21FE;
	Thu, 23 Oct 2025 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OwUm7gI7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97E329BD96
	for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761204710; cv=none; b=ZhjsLKyO9i1AshnWCx2F2+BVrf2IJP2FKA6zdjho0uCmtCpyLV1MfmPpahsK5cGBSmCXkdnbkLhtNl59g22Tyxoa/l9D365PHKqhfD5sLOjaX8+mXqXVqSOcxWka1W7xsIHth8/myB2/rNYuItOayLCYIPKrMA/dMmmc2dzGR7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761204710; c=relaxed/simple;
	bh=JggR+4lhgxon5VrrXYFEgHKpnGz2RPpuX3MhDbFS6oA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YdKO9qz3TD/dB/ckAcjbQtzL/VvlnvSwP33d9sJEyCTlBmWhGPnWzfR1GAL5zvDaorXAijNGHwD4094PAQMFtKzJOzd4vcHcivLo1Jx7Vlqmb5WvlGYEcccTfTLO4+cWKZ10tIF0l4o+yPp+tmqzhdocLpwQ6PM8Mwca7gM2Ma4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OwUm7gI7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4711b95226dso4770675e9.0
        for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 00:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761204706; x=1761809506; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7rh8SJ9gjn1LcIjZxSZPwMUci0AXXC8rNsZtSMot00=;
        b=OwUm7gI7yUShSrk0jh9u0lGcwjlmuDRCOb9aTbX2JH2yMiIR1ZnGny7dLi6iH7IvDD
         mQDGtkK82qmw8JH3zmv3qcT8eOXmKsCvKdgeYA+MblFnJJ3CoajMBYBXAZHJQXDfuSmT
         zH/7KErKfLpFJPBHaRNVUWMihfHbvx5e9cDKdK2+FAi7JjmiKtKWSB5uKg858mGz0fTn
         8vAOnaY7R9Xl7JO51byhfv5Jlo4KwMvshCPzn+KlWT8+Z3wWa+kVvlZGBc9tkOiM8tsU
         zJiwlI/Cj1avm+sCLyUXfn7rTU8hJ3pmsIsUW880/7RtDKnFmX+tC6RB9hwf56zaUu5A
         2OcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761204706; x=1761809506;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j7rh8SJ9gjn1LcIjZxSZPwMUci0AXXC8rNsZtSMot00=;
        b=BN42mBOxIXetkBLL3WIBOtMg13kxF6+1VJ/o9p/kT0Sd9hik3wYT+B7EjaR875d9uy
         DKuFSnmJ71l3sbifzpoGmjYxhQPVa0LBcqZ9TqYoUluHZWyeybTnh84us5yYwCiNS+8B
         b4ycRCTegyNfi97xNl8AWijHS+7OQMTnazOJ1oIQ1GCgVrq21oc1/7YCMUXQxdoN9Ih6
         WtklwicZECvpSAm4+Mxy02P1Dx0aNOBs2YxCqZYK8bPNRh+fJeix7j2JIlDY1TAQroav
         ahel5NW8/Cq/dUgSRyGOQLZiH1cAkjmTl77i3TWY8hDZ7HfMOnqnCXEthYHgfOn4G2DK
         N3Tg==
X-Forwarded-Encrypted: i=1; AJvYcCURHVJ01E8vejSMspX6vLr9/Hhe7YHnb8fnfyc048+r03277sQcawaLXDjSg42ZNOSyyEuePuC5K54=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0wv9MIh56JF+rhxzWX+UH//3xtliLB8AFEaYp0eLVMC7mw6eJ
	x5uTFDkbhNkSK1e8bJD81vlqLUy+QCDCNoh0uEGf+F2b1DiHDcuNgCoXHQoEA3iSCNXv0NKOanb
	h6gH1
X-Gm-Gg: ASbGnctZSnEai9wmzptA5Cv29kRaPQhxSlJ0Zl3k+ovsPArxGptPaGPHr40i2dNYtJe
	0yyhbxO4/Eh40znJwCIuZZsKyt0vGTb2PwIMsNKQv6E1rw6YOi/lrCy7bRFqhGmmUyOzyKBRmiJ
	OaZFVGwx4zm3b+mdwskvtLF0020+s7t+ef/aadzig3U30HxJg8c1ZWlmdOwWtyW6T3CKTyE62X5
	+ITrU6lpK3vc61r5wJvmR0LSAYJTB6U/otj+u4QhwFCyDKQIsWr0LS3++sbwotQDuNJ8H6fnSKs
	iGalyguvOjt1XfsXbQUPOMTXt5czKx++86ccKjI3dNcoInuGaoF9b/DFiH2BJkK0OVUPMuK3egk
	eB8F1MmcYzjLiKvASAn397QWtZWgOsXzaWgDIOVwVnmj1QL6QC4WciYsIerqxkUP5fNcWhqvOSh
	TZRdcqEvjS+j0SAqVU
X-Google-Smtp-Source: AGHT+IESUWagdqnffAAf3bOVzRjniJgfIHxBtYyyZ9IRSdPPeiTfClecTkaGhBF5qh1fVlFvauXFYg==
X-Received: by 2002:a05:600c:3b8d:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-47117917155mr159364105e9.26.1761204705823;
        Thu, 23 Oct 2025 00:31:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c428e9b2sm82179725e9.5.2025.10.23.00.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 00:31:45 -0700 (PDT)
Date: Thu, 23 Oct 2025 10:31:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jack Pham <jack.pham@oss.qualcomm.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [usb:usb-testing 45/48] drivers/usb/typec/mux/ps883x.c:171
 ps883x_sw_set() warn: inconsistent returns '&retimer->lock'.
Message-ID: <202510231023.aJ09O6pk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   93741bd104ce07a790519ecee3a331ee7cf61ae3
commit: f83cb615cb7a615f9c15787f914a8eee1c6e93d4 [45/48] usb: typec: ps883x: Cache register settings, not Type-C mode
config: i386-randconfig-141-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231023.aJ09O6pk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510231023.aJ09O6pk-lkp@intel.com/

smatch warnings:
drivers/usb/typec/mux/ps883x.c:171 ps883x_sw_set() warn: inconsistent returns '&retimer->lock'.

vim +171 drivers/usb/typec/mux/ps883x.c

257a087c8b5206 Abel Vesa     2025-02-06  145  static int ps883x_sw_set(struct typec_switch_dev *sw,
257a087c8b5206 Abel Vesa     2025-02-06  146  			 enum typec_orientation orientation)
257a087c8b5206 Abel Vesa     2025-02-06  147  {
257a087c8b5206 Abel Vesa     2025-02-06  148  	struct ps883x_retimer *retimer = typec_switch_get_drvdata(sw);
257a087c8b5206 Abel Vesa     2025-02-06  149  	int ret = 0;
257a087c8b5206 Abel Vesa     2025-02-06  150  
257a087c8b5206 Abel Vesa     2025-02-06  151  	ret = typec_switch_set(retimer->typec_switch, orientation);
257a087c8b5206 Abel Vesa     2025-02-06  152  	if (ret)
257a087c8b5206 Abel Vesa     2025-02-06  153  		return ret;
257a087c8b5206 Abel Vesa     2025-02-06  154  
257a087c8b5206 Abel Vesa     2025-02-06  155  	mutex_lock(&retimer->lock);
257a087c8b5206 Abel Vesa     2025-02-06  156  
257a087c8b5206 Abel Vesa     2025-02-06  157  	if (retimer->orientation != orientation) {
257a087c8b5206 Abel Vesa     2025-02-06  158  		retimer->orientation = orientation;
257a087c8b5206 Abel Vesa     2025-02-06  159  
f83cb615cb7a61 Konrad Dybcio 2025-10-14  160  		ret = regmap_assign_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
f83cb615cb7a61 Konrad Dybcio 2025-10-14  161  					 CONN_STATUS_0_ORIENTATION_REVERSED,
f83cb615cb7a61 Konrad Dybcio 2025-10-14  162  					 orientation == TYPEC_ORIENTATION_REVERSE);
f83cb615cb7a61 Konrad Dybcio 2025-10-14  163  		if (ret) {
f83cb615cb7a61 Konrad Dybcio 2025-10-14  164  			dev_err(&retimer->client->dev, "failed to set orientation: %d\n", ret);
f83cb615cb7a61 Konrad Dybcio 2025-10-14  165  			return ret;

mutex_unlock(&retimer->lock);

f83cb615cb7a61 Konrad Dybcio 2025-10-14  166  		}
257a087c8b5206 Abel Vesa     2025-02-06  167  	}
257a087c8b5206 Abel Vesa     2025-02-06  168  
257a087c8b5206 Abel Vesa     2025-02-06  169  	mutex_unlock(&retimer->lock);
257a087c8b5206 Abel Vesa     2025-02-06  170  
257a087c8b5206 Abel Vesa     2025-02-06 @171  	return ret;
257a087c8b5206 Abel Vesa     2025-02-06  172  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


