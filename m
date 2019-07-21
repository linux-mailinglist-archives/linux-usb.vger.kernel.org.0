Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE5976F4F1
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jul 2019 21:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfGUTYP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Jul 2019 15:24:15 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:51083 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfGUTYP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Jul 2019 15:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1563737054; x=1595273054;
  h=to:from:subject:message-id:date:mime-version:
   content-transfer-encoding;
  bh=nJaJOf4oeBNt8gWicZmXhV61THh95xs3fSMZAFxmaLI=;
  b=qZscZooSMGo6De0FFtO7vSOdQwuKcDc8vWjvbr/J3sTtx2sp858PhMZf
   43EN74Gl90Q+oYjVhJR78+PUc0xXFp4nHrfCYvvgEnAhmPNCiwSSSjpBe
   emxzLyJHKdzvbA3dWGDaUygh8WYoXjlfWb8GO8pWVx8teonG6kY/k1Z4C
   A=;
X-IronPort-AV: E=Sophos;i="5.64,292,1559520000"; 
   d="scan'208";a="686796337"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.22.34])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 21 Jul 2019 19:24:12 +0000
Received: from EX13MTAUWA001.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS id E125BA1D62
        for <linux-usb@vger.kernel.org>; Sun, 21 Jul 2019 19:24:12 +0000 (UTC)
Received: from EX13D07UWA002.ant.amazon.com (10.43.160.77) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sun, 21 Jul 2019 19:24:12 +0000
Received: from c4b301cf6c3f.ant.amazon.com (10.94.89.238) by
 EX13D07UWA002.ant.amazon.com (10.43.160.77) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sun, 21 Jul 2019 19:24:12 +0000
To:     <linux-usb@vger.kernel.org>
From:   Peter Bowen <pzb@amazon.com>
Subject: typec class users
Message-ID: <d0b357e0-b915-c035-3c34-65d03f597f1c@amazon.com>
Date:   Sun, 21 Jul 2019 12:24:51 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.94.89.238]
X-ClientProxiedBy: EX13MTAUWB001.ant.amazon.com (10.43.161.207) To
 EX13D07UWA002.ant.amazon.com (10.43.160.77)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The typec class claims to provide comprehensive info about ports,
cables, and plugs.  While there is code to register cables and plugs, I
can't find any users of these APIs.

I'd like to write some userland tools that help debug issues with Type-C
(e.g. wrong cable type).  However none of drivers seem to use the typec
cable or plug interface.  Are there any known drivers that use these APIs?

Thanks,
Peter
