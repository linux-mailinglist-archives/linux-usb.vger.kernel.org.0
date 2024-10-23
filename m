Return-Path: <linux-usb+bounces-16588-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 270819AC784
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 12:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C34C3B26CBB
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 10:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58CE19F46D;
	Wed, 23 Oct 2024 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpat998d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06B71A08A0
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678277; cv=none; b=lreRI1QSMIJyHewfexWdGBJirB4zIigLn0j45+Z3NJQU9tawYXwEtuORaMBxmSX6m/Tm7LYD6WeTtRrbTy9Zk5mHKl7EtwUwD31TzZx4RkSZKVzMqYNRInY+GfGh/iLm4PunxChb3/SGO1Ee5qxKd8fO7mGGawMMgNdq6LqBczY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678277; c=relaxed/simple;
	bh=CQwHmAcu3MK6VCQBcSdjI2oqDD7Wf/1tUuAYJdJ10P8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t+fG+xL0FrQ+svj8381RACcNY4T2oSawW+oz/o8tgXt4VnyOlNoQ+iZEf9miOjav+f3QfLRebKqAJf1AS+eWNdOMkZd/vWoYISAAw+7scKTKiOs2NkyQv7TgYYwLIkh8cSxJqH8fiBDfmIGjcr7JPEa09AKml+gON7n09Ir/y3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpat998d; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729678276; x=1761214276;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CQwHmAcu3MK6VCQBcSdjI2oqDD7Wf/1tUuAYJdJ10P8=;
  b=jpat998dQo3m/vdPbducg9yOnbIQmQPXSr3FNkI1Td8sXb7MyAiBF/Zn
   Lu4zXEiKdUV38JREZYqd+wmJfy0/tAw35j6QqdAB9M/2uT0HFzkNR+sml
   m+ELqrnD8gRR5w6WcIhgvhe1JW38XtdR91KIW2nK1vXWqS2/F2GAj7dny
   UP+fRkrXi9hUozSMJoQdeE1mVW6bv47Kfosvqiuxnv863lriys8bn1EuU
   zVZtVj/rtQSJSbM9zFbUaYwlKVS95vlsV6z+zMGhzs5bgk66oQ5JDMP5f
   Lb7xTiRqhWJ6qC03H97wEdhxJ0vBgGekPxtPdgSxebLvK3BB93b/vRMWA
   A==;
X-CSE-ConnectionGUID: TxtCxu3gT8inNQbMlpggNw==
X-CSE-MsgGUID: xusuEYhDR0u+LijUExuwGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29149601"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="29149601"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 03:11:15 -0700
X-CSE-ConnectionGUID: hyT84XtKSHmuJJLTkT1xhA==
X-CSE-MsgGUID: 5fCe5r6ESJW37CEVB3mp6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="84954597"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2024 03:11:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 01366343; Wed, 23 Oct 2024 13:11:11 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aapo Vienamo <aapo.vienamo@iki.fi>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/8] thunderbolt: Add support for USB4 v2 Gen 4 lane margining
Date: Wed, 23 Oct 2024 13:11:03 +0300
Message-ID: <20241023101111.3418311-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series from Aapo adds support for USB4 v2 Gen 4 link symmetric and
asymmetric receiver lane margining. Useful for instance on manufacturing
floor to check stability of the electrical signaling.

Aapo Vienamo (8):
  thunderbolt: Don't hardcode margining capabilities size
  thunderbolt: debugfs: Add USB4 Gen 4 margining capabilities
  thunderbolt: debugfs: Implement Gen 4 margining eye selection
  thunderbolt: debugfs: Replace "both lanes" with "all lanes"
  thunderbolt: debugfs: Replace margining lane numbers with an enum
  thunderbolt: debugfs: Refactor hardware margining result parsing
  thunderbolt: debugfs: Don't hardcode margining results size
  thunderbolt: debugfs: Implement asymmetric lane margining

 drivers/thunderbolt/debugfs.c | 504 +++++++++++++++++++++++++---------
 drivers/thunderbolt/sb_regs.h |  32 ++-
 drivers/thunderbolt/tb.h      |  16 +-
 drivers/thunderbolt/usb4.c    |  18 +-
 4 files changed, 412 insertions(+), 158 deletions(-)

-- 
2.45.2


