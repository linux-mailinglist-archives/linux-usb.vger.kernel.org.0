Return-Path: <linux-usb+bounces-25169-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1928BAEB99E
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 16:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 789AF644210
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 14:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5642E2E2660;
	Fri, 27 Jun 2025 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqj10TmX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A5D2E11CF
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751033947; cv=none; b=jdeheLEoBRtXYc0Mo19EaxVnBkIJDYnV+2ZRbnfBlYl/c9CWDZxDU7cyHHw/1m5nZ6m6Y58A7fa/NlQMVqZHRULtylBixAP6z+pGc0lXaS53c7ASO/C6oSFNvoXpfLx9D1UMPXXIM9n9kfKZgzFMBKFL10U0adZnwmmWYFriAWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751033947; c=relaxed/simple;
	bh=FEQQ4U5BXFAMSNmTLJpwqBlgAmoJKrkF1sG8ItGi2Lc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KW8CQuYWQ37JbntsmQsZHpclbciAgPPrSJBKTi9BRjjDrnwe4Q6D1kMIZn3Audq/dBwNZ68Z5GQHK9+Niw8mW3NuWgoyIu1oPlFPqD6/q5Dqv35llj/YreiJbOiDiqpWqxJevMLQR1LClUnJy79uHr/Dy3P/HRV9JnaPpsyw8vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqj10TmX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751033946; x=1782569946;
  h=date:from:to:subject:message-id:mime-version;
  bh=FEQQ4U5BXFAMSNmTLJpwqBlgAmoJKrkF1sG8ItGi2Lc=;
  b=gqj10TmXjgJj6DpRsyEt/BMgoZ/jENWENsBLzxVWK2PSGO6KSW6Hiqt0
   UE0SSuGF2it41XT5enM7JlUpxrKYcEkN7Q2p0t2byOA5a5zczxcCafJU7
   sKQe2FjB+U6RFiO5PhdDUWp+l5iXZFfH7dh4f/xRq6I5+qMDhLRmCN+XM
   /56uwP4q7A0wmVlfQJogGS1OYrIFAGA/27HseYkQzGwjhb+67Zy3LZynk
   C/qy7DwdWTMI0koauWgTAy7Nfgx4ZZPdHEniJExGb3nkLNU/gEk7yjxUe
   PsmraHeNquAjKrEbVWf/wWrluOa47oGyeKh7VUBDcIRnNh8bbJ1TIyUGQ
   w==;
X-CSE-ConnectionGUID: OOQOOtHfR/yWPXRqWcBXVw==
X-CSE-MsgGUID: P7nRQ6J2RNaApOns6bLMVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="52467185"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="52467185"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 07:18:52 -0700
X-CSE-ConnectionGUID: uXG0R5D4SGmTlWQxjwkIkQ==
X-CSE-MsgGUID: aSOhMvA5QkanqCSQEtiHgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="158547859"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 27 Jun 2025 07:18:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A477E2BA; Fri, 27 Jun 2025 17:18:49 +0300 (EEST)
Date: Fri, 27 Jun 2025 17:18:49 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: USB4/Thunderbolt maintenance on vacation most of July
Message-ID: <20250627141849.GO2824380@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi all,

My vacation starts today (27.6.2025) and lasts until 28.7.2025. Most of
that time I have no access to any sort of computing device.

Have all relaxing summer. I'll see you again at the end of the July.

