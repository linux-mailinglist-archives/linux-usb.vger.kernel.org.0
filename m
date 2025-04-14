Return-Path: <linux-usb+bounces-23038-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6AFA88A73
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 19:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CEAD7A6BAA
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 17:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7DD1A3A80;
	Mon, 14 Apr 2025 17:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1Q7Tf4t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ABB261575
	for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 17:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744653361; cv=none; b=ZvTVD7ZJb/nVAr4C1viS/np1LLZ7fkKwlrhVNkNTedehSgaQQJRhgXkiYLd4tf+PquvbiEAziOO1+isa4GGSfK/87JiNtAtrXT6wRhM1gG0gyJho0IgxETrPSMqghEjpDMxpRPtpmUmmdpIab5Z5mJJBxq3v+Ni/2qBVSN5UNo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744653361; c=relaxed/simple;
	bh=gEooOdOwWisf/FiM09pQ6Tf51SZhwYuHSkxLW6YuTeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVgzwK84YnwfrHbuSXhgQOomolaesW87RChX8ShcWB120y1Q8Yrj9EAM3gnBdRk04GFh/sUVC9ZLnwXkKWOoD8GmRwy5jJGuAfcWZib5cmsZ2oXaFLuDQxNrxhp0ckiCNRmrb8mWQpTrTkTkMN1qPzIMauCAWDRDvz3zBueUIgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1Q7Tf4t; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744653360; x=1776189360;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gEooOdOwWisf/FiM09pQ6Tf51SZhwYuHSkxLW6YuTeo=;
  b=j1Q7Tf4tvbxMbxgRx3gcL565YlHnW5c4Wv47jTs5QgE7qYAJhOQxWocB
   s6cVpk8BeCKXTvmZwxUKhFdu245PglvQF7n4Lx8Kg3wbBRfARNNpxM5L1
   d64WTVBlPK5Bsw9z2M0BMJOpgwIaCp99MUdCjN/aDZdR1v1NfH8o5MzEh
   5eRvbCbzAX6riA050WYWSj2ydyDzyE2EQun7FDH6XX7ALoGtiSWYuq/bI
   lynbL/XsvHDDRUuBi5yEkS9SmzEMJoNIwHYbxbAjhYYSvP14foeodBFOC
   R00njtyz3TKOW+D8TB2XZeYVTfT35D3y//V4ULySIJar8ZDeA3TDM8XPR
   g==;
X-CSE-ConnectionGUID: FZRzpdW0R2qaqlngKa1HIQ==
X-CSE-MsgGUID: wtdhjBeGQAydVzI7CulGEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56779841"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56779841"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:55:59 -0700
X-CSE-ConnectionGUID: 7k5lOZGhT3+saHWT187G5w==
X-CSE-MsgGUID: Tudl2DjlSlCjRIPJPSDwDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134866357"
Received: from vpanait-mobl.ger.corp.intel.com (HELO aborzesz-desk.lan) ([10.245.246.215])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:55:57 -0700
From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: mika.westerberg@linux.intel.com,
	andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Subject: [PATCH 0/3] Introduce Thunderbolt/USB4 <-> USB Type-C port mapping
Date: Mon, 14 Apr 2025 19:55:51 +0200
Message-ID: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

This patch series introduces the creation of symlinks between
Thunderbolt/USB4 ports and their corresponding USB Type-C ports. The
primary goal is to provide users with clear visibility into which USB4
port is connected via a specific Type-C port. This provides the same
functionality that is already present in Chromebooks.

Alan Borzeszkowski (3):
  thunderbolt: Expose usb4_port_index() to other modules
  thunderbolt: Add Thunderbolt/USB4 <-> USB3 match function
  usb: typec: Connect Type-C port with associated USB4 port

 drivers/thunderbolt/tb.h        |  1 +
 drivers/thunderbolt/usb4.c      | 14 +++++++--
 drivers/thunderbolt/usb4_port.c | 56 ++++++++++++++++++++++++++++-----
 drivers/usb/typec/port-mapper.c | 23 ++++++++++++--
 include/linux/thunderbolt.h     | 18 +++++++++++
 5 files changed, 99 insertions(+), 13 deletions(-)


base-commit: 306a14d03f47fa152c7e47be544d8d582d387a20
-- 
2.43.0


