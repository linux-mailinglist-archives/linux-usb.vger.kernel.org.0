Return-Path: <linux-usb+bounces-14241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B879962D71
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 18:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03429B246B9
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 16:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F106F145B21;
	Wed, 28 Aug 2024 16:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SICh/Ch7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00C41A254B
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724861707; cv=none; b=cugniRmCVae7HmM0hDyS48eO9AHGa7pAKGZFErWvuM4eqclYRfVCaAQ6nJtRGGNQS2To8Wm2wCz9XtEnIIWyRMJJaZ+X+JqzpwDTjAmvQYakwSJYd7U9NK+fwvLCwbO6g+afqOYfOFw596fmsIR4MrK6yyHOI7QzGN9Ry8+5Pz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724861707; c=relaxed/simple;
	bh=/aROlqrzQt2TNNz8rXE3d2ZKbhJEPvY3qwc6FmiZGUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y1qEAxiIzLKvxb+38hey7uuiNzIyCBp0AcwzKNmEhrO9f+kcQ4KJvZhrig1cQWOCAERUBdM/patGYvOdgF8eJxq0Wr3A229xTFAXC96rH39SWvcOgRVbI4WHENdIeWeTr4F5orUrR3aJaHjUBfTMRPk0wbr5EFGfvfrN9wMNSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SICh/Ch7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724861706; x=1756397706;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/aROlqrzQt2TNNz8rXE3d2ZKbhJEPvY3qwc6FmiZGUs=;
  b=SICh/Ch7CR4mPrxkE9H4HQUOK1panmZvy3xRrara/aqMPfOt2bIjGwJe
   f8ckKwQTu92r6GB2GLGJqY6YneZI9U64H/VzMrdr2LoXC2e1heW1QczFE
   XSiWwDFuxxFS3khdtOzksu8vdLc2QSNO81QQS8FIirTpBdG5dSnhxRSt1
   yj4145OV1njZRijM06v1qoyrmZLu9w2ePuj8r9Vwn6diadRXjHPJbxGPK
   zbaJqVLqCmEChtpOyxdODxoE6DsxLY0CLs+l8VlpGqhkfVHDnzyynLE5c
   QEBzapJeeRFZXHItsBgPwH42Mg+msTAzDhVkr8Zjxgfthts13NpTR6kBE
   Q==;
X-CSE-ConnectionGUID: SzDpor+MQ8ugJeCVmZel8w==
X-CSE-MsgGUID: OFDRJ4OOQ8ubSEwJpUCIrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23566068"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="23566068"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 09:15:05 -0700
X-CSE-ConnectionGUID: uE4gIEKHTJCfdUiGPZ8gyQ==
X-CSE-MsgGUID: 9Zq7hRMdQPOuhyW1Vi2Jmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63605469"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 28 Aug 2024 09:15:03 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Bartosz Szpila <bszpila@google.com>,
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>,
	linux-usb@vger.kernel.org
Subject: [RFC PATCH 0/3] usb: typec: ucsi: New way to handle GET_CONNECTOR_STATUS
Date: Wed, 28 Aug 2024 19:14:58 +0300
Message-ID: <20240828161502.2774996-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I'm getting rid of only struct ucsi_connector_status, but my plan is
to remove all command specific data structures that don't align
naturally unless there are strong objections against it. Ideally we
could use bitfields - that way using those structures would not be a
problem - but I guess we still can't.

So UCSI_FIELD() is a hack, and may be replaced in the end, but it
works. I need to check if we can use bitmaps instead, but I did not
get that far yet.

The last patch is probable the one that you are really interested in.
Let me know what you think.

thanks,

Heikki Krogerus (3):
  usb: typec: ucsi: Helper for Get Connector Status command
  usb: typec: ucsi: Remove struct ucsi_connector_status
  usb: typec: ucsi: Helpers for new GET_CONNECTOR_STATUS fields

 drivers/usb/typec/ucsi/psy.c       |  28 +++----
 drivers/usb/typec/ucsi/trace.h     |  22 ++---
 drivers/usb/typec/ucsi/ucsi.c      | 110 ++++++++++++-------------
 drivers/usb/typec/ucsi/ucsi.h      | 128 +++++++++++++++++++++++------
 drivers/usb/typec/ucsi/ucsi_acpi.c |   7 +-
 5 files changed, 179 insertions(+), 116 deletions(-)

-- 
2.45.2


