Return-Path: <linux-usb+bounces-14572-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9B596A13D
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 16:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A5C81F22946
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 14:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D128C155A47;
	Tue,  3 Sep 2024 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjXBE2XI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253D53BBF0
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375227; cv=none; b=SIEb6VBnkCEKNr2gOHLl+7fZ0kWE3COJW3NE/BVRrEbf3ttZiuNUGd6tFsLCTKxq8pzK00qysDTYtppoOXzh3+ZfX0KwttuJhSf+H4gpXk4WGRoJ7K/9MubJ9HSFIlLzy8WgMlvnR5px7Jbf5ciDiqoPSkVgQtqo6KoBaMOBDdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375227; c=relaxed/simple;
	bh=LIY6tgFoeJFw4QBhJeGjM9Ly5z1RMY0jU5bftKy7uS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tdJjvC4fSNlqqImFghe4CVzkfb8gFNo2VJ0rAFyqSapY6LQsHrgwKVphJMoaK5DUdrVyFrc2oq1uH6chndlS9GQGKxgMPAsigfneqT1jM0HrcHrg7umzO2Dt2eEvRh9C04oUGzB4nIMWlEyRst1mce8yqUNQipaEnKQH+HUb6Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjXBE2XI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725375226; x=1756911226;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LIY6tgFoeJFw4QBhJeGjM9Ly5z1RMY0jU5bftKy7uS0=;
  b=hjXBE2XI8Q01140q8hzzLW+mBArQJeRBRg4q+Nvl4/+qYmYbfJh3lgop
   dEinYNBY3I3WujrG5NHZy+/8QnqOfGG0ZZPbEznjDuevj/rzwlbuGqxXN
   +Qa7bPyO7qO5IFyHEplk7BA+sWwNYf9RgS72jodY4CrYCTYClncLCV97L
   w9OCCfHBV7eu+zpc1JbwlNnCTr5W5zL0Mu0ODaMjsVE1e3HewFIyYyO+U
   ALRZW2MKKt+ppUIjTUpXkd/QKUbMCob8vmRuJtrhIvlhybcasK8EaMTTk
   Jf6y9aNoG516pHF/TMLsix9tqrteEPUqpxToNlKIEcguLqSqXKk7oSh9B
   g==;
X-CSE-ConnectionGUID: qLXFCf19S/ObpBBlovgcJg==
X-CSE-MsgGUID: a0DySq+KR1SmEvAVsei+1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41474064"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="41474064"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:53:45 -0700
X-CSE-ConnectionGUID: K70St92ERDuXFWG7rTNWYg==
X-CSE-MsgGUID: HSRY2VHHT6ag5IX0ibwL9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69564322"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 03 Sep 2024 07:53:43 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Bartosz Szpila <bszpila@google.com>,
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>,
	linux-usb@vger.kernel.org
Subject: [RFC PATCH v2 0/2] usb: typec: ucsi: New way to handle GET_CONNECTOR_STATUS
Date: Tue,  3 Sep 2024 17:53:40 +0300
Message-ID: <20240903145342.3449969-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a bit better version of the idea. I'm now using the bitmap
API, but there are actually not that many other changes. I converted
GET_CONNECTOR_CAP and GET_CONNECTOR_STATUS.

The original version:
https://lore.kernel.org/linux-usb/20240828161502.2774996-1-heikki.krogerus@linux.intel.com/

thanks,

Heikki Krogerus (2):
  usb: typec: ucsi: Helper for Get Connector Status command
  usb: typec: ucsi: Convert connector specific commands to bitmaps

 drivers/usb/typec/ucsi/psy.c       |  28 ++---
 drivers/usb/typec/ucsi/trace.h     |  28 ++---
 drivers/usb/typec/ucsi/ucsi.c      | 135 ++++++++++----------
 drivers/usb/typec/ucsi/ucsi.h      | 195 ++++++++++++++++-------------
 drivers/usb/typec/ucsi/ucsi_acpi.c |   7 +-
 5 files changed, 206 insertions(+), 187 deletions(-)

-- 
2.45.2


