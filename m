Return-Path: <linux-usb+bounces-32612-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEcUE+O+cWkmLwAAu9opvQ
	(envelope-from <linux-usb+bounces-32612-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 07:08:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E254B622E1
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 07:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 53C4A52732C
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 06:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0AE478E32;
	Thu, 22 Jan 2026 06:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E6fE8EfQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEE9344020
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 06:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769062076; cv=none; b=K3vnfsUm+dJegHMojk8yx4Y1Gis0iwWiaaWAisC0VhlO1bEk2KiKsmChi8Sd1jApHYadU0PBx82chZppCVSgIKBaSy9fMfU+Q+Jx3eu//jvc/e+vJG2xNi4ypE99ZSx9kZtLtYg6rdIgaYQzHU2O+pNwHqvEm8jKaIGjpQUfEMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769062076; c=relaxed/simple;
	bh=1o5NqahfDQ5VNbcqleS+o4wBaycfjfXYCwkC1X8D/Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=s1XsBpPhJ66x9L2xQU+NjUNSlsg6qTisZ88yj9Q3tZQiahLausy3eCiW7anfdqqJpOCnYLLmgscZFAd5jl30ZiiygXCyeXtCGIiZkMqMhJ050gGiJlG4EMfKjI5vaDmNpUHlWURC5pxeiqdMOlM/4pOgbO6cfmTySznor5Xmgwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E6fE8EfQ; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-4358fb60802so299632f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 22:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769062073; x=1769666873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WNY/LXM5CUd8SovQrwoI4Q/jBB7ob8o4qFKazdU5gjs=;
        b=E6fE8EfQoT2TU/D2TUhyuS5CAPitE+TKJqi4jwHmSl/LvU9N8XetZudDtGmwde2Nhw
         AZpB+OxRvgBa0yXrekcEojBQ2znWGaYLCuxd2sIeADdmGN3Jp8tJZXcTSlYdxqcGzZms
         ykMBErdUJJnOPhp9lZWpcDz3+FE6awirjAtnliNRfTKk69jp7nv88mzy9Dwkp/3x/FEC
         Fkkyxw3nzICqD+RTC9NrtaIwt7/f1MATXCM1RCAfSVBS1A7CkYaKW5B499q4zX6qosld
         Pu2U+IeoiKWjkdzzSkLrfuigWf1qsd3FTICaO6kqLwjXAxGff7CPbwtUk/E+mTpi5nAn
         P0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769062073; x=1769666873;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNY/LXM5CUd8SovQrwoI4Q/jBB7ob8o4qFKazdU5gjs=;
        b=T4h3lGe8jiHa4Mspg56kTQJb03dEgYgPVxjpQVt+feKcEsho47IjBtOrjSzxq8NcwQ
         ZhDaNuU5QIpv4KDr5PkC2HMesW3Nd2G5rpcM5+QjJBvTzHnSlVPXIt74ZhwsDQ5zu41A
         fTkfxCmJeASAjZIlZxy8u+F8nyY5rHIVFA1AOCSKWQVISgpwcbTwWYTZalPoC5hlkbcR
         4p4e7is1Adl5/eh76QsuxGKX+mVSSzFgVwKVNEs1RsEAY2nszAGN/OUMIc41wJm+hX9R
         +aSuMUlxAZsr0rqGndzbeI6c7nLOBzD3RMVpPEf+6ZXINvFyg22rUg5rePFd4k3eqxa/
         7bSg==
X-Forwarded-Encrypted: i=1; AJvYcCWRVWudNez3Azud9VM++OLM16ohlSXSe4QZ9og9CXQmIP6XUL/N8fNVBFTiH70K8ol3/sr4by8Vmhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaXFPhFiPU8mc5aS2sxorYPslVt0sIklg9NZmFO4x1CIYw13Eh
	tS+YIVhRENwTnjHT7W0nJRC1ICnLuAlJMKCFHquyGP2JkI6n2U66B8zbFugWgt2NnCg=
X-Gm-Gg: AZuq6aKDZXyQz+B+lMPCgNbIBdGdBKvKKqzKlglJKu16ZjuSoNH9oqvR7E15/v71kVg
	m8fkHyQS4PH/RnjgOteM/HgwklVo6i5o1CFgP/b0LCXoO4sHwwumxNRgbk6g3KzSfP2HpvBDlIW
	iEnYKmC4E3/oW+KHNw5AaRi3z2w7BOHHgFYy6l4cSu4ER4eCR+42cczxbHpdLcBvBOz5lk10SSA
	ekEruYuRafOuvxsbDvVngaOJpLHldlfzp8xSPJhVo6s5guzB1QhXXH8xLI408HCL/0Li2uaY5iZ
	5aqXP8XqC/gXbWidJlXJky1ItvZrqBorVKl8fBVV8PfWkaTF5HqwMQDOC/HH0+HMWImG+Oc1HSp
	/UUB2fTp+tO/Vm+KUWumZeShcMi27b5dx69VdM6avBuh1O/YEYANYExxOt3i+GHQtm9BbfMlzrV
	n07IDzCFED1JKE1uNK
X-Received: by 2002:adf:e88b:0:b0:435:9635:2943 with SMTP id ffacd0b85a97d-435a5f757a6mr2857800f8f.17.1769062072600;
        Wed, 21 Jan 2026 22:07:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992201csm43165202f8f.2.2026.01.21.22.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 22:07:52 -0800 (PST)
Date: Thu, 22 Jan 2026 09:07:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <202601220733.dS3GMZRD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121060857.237777-1-acelan.kao@canonical.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32612-lists,linux-usb=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lists.linux.dev,canonical.com,gmail.com,kernel.org,vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,linaro.org:email,linaro.org:dkim,git-scm.com:url,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,intel.com:mid,intel.com:email,work.work:url]
X-Rspamd-Queue-Id: E254B622E1
X-Rspamd-Action: no action

Hi Chia-Lin,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chia-Lin-Kao-AceLan/thunderbolt-Fix-PCIe-device-enumeration-with-delayed-rescan/20260121-141206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20260121060857.237777-1-acelan.kao%40canonical.com
patch subject: [PATCH v2] thunderbolt: Fix PCIe device enumeration with delayed rescan
config: arm64-randconfig-r073-20260121 (https://download.01.org/0day-ci/archive/20260122/202601220733.dS3GMZRD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601220733.dS3GMZRD-lkp@intel.com/

smatch warnings:
drivers/thunderbolt/tb.c:128 tb_pci_rescan_work_fn() error: uninitialized symbol 'dev'.
drivers/thunderbolt/tb.c:2392 tb_tunnel_pci() error: uninitialized symbol 'dev'.

vim +/dev +128 drivers/thunderbolt/tb.c

d6d458d42e1e15 Mika Westerberg       2024-08-20  102  static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port,
d6d458d42e1e15 Mika Westerberg       2024-08-20  103  					  int retry, unsigned long delay);
4f807e47ee9a75 Mika Westerberg       2018-09-17  104  
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  105) static void tb_pci_rescan_work_fn(struct work_struct *work)
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  106) {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  107) 	struct tb_pci_rescan_work *rescan_work =
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  108) 		container_of(work, typeof(*rescan_work), work.work);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  109) 	struct tb *tb = rescan_work->tb;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  110) 	struct pci_bus *bus = rescan_work->bus;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  111) 	int devices_after = 0;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  112) 	struct pci_dev *dev;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  113) 	struct tb_switch *sw;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  114) 	struct tb_port *port;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  115) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  116) 	mutex_lock(&tb->lock);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  117) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  118) 	sw = tb_switch_find_by_route(tb, rescan_work->route);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  119) 	if (!sw) {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  120) 		tb_dbg(tb, "Switch at route %llx disappeared, skipping rescan\n",
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  121) 		       rescan_work->route);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  122) 		goto out_unlock;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  123) 	}
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  124) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  125) 	port = &sw->ports[rescan_work->port];
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  126) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  127) 	pci_lock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21 @128) 	for_each_pci_dev(dev)
                                                                         ^^^

eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  129) 		devices_after++;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  130) 	pci_unlock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  131) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  132) 	if (devices_after > rescan_work->devices_before) {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  133) 		tb_port_dbg(port, "pciehp enumerated %d new device(s)\n",
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  134) 			    devices_after - rescan_work->devices_before);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  135) 	} else {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  136) 		tb_port_info(port, "pciehp failed to enumerate devices, triggering rescan\n");
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  137) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  138) 		pci_lock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  139) 		pci_rescan_bus(bus);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  140) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  141) 		devices_after = 0;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  142) 		for_each_pci_dev(dev)
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  143) 			devices_after++;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  144) 		pci_unlock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  145) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  146) 		if (devices_after > rescan_work->devices_before)
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  147) 			tb_port_info(port, "rescan found %d new device(s)\n",
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  148) 				     devices_after - rescan_work->devices_before);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  149) 		else
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  150) 			tb_port_warn(port, "no devices found even after rescan\n");
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  151) 	}
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  152) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  153) 	tb_switch_put(sw);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  154) out_unlock:
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  155) 	mutex_unlock(&tb->lock);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  156) 	kfree(rescan_work);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  157) }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


