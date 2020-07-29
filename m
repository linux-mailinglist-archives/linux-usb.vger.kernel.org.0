Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3BB232615
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 22:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgG2UWE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 16:22:04 -0400
Received: from netrider.rowland.org ([192.131.102.5]:40379 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726365AbgG2UWD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jul 2020 16:22:03 -0400
Received: (qmail 1584985 invoked by uid 1000); 29 Jul 2020 16:22:02 -0400
Date:   Wed, 29 Jul 2020 16:22:02 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Roger Quadros <rogerq@ti.com>, Peter Chen <peter.chen@nxp.com>,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH RFC 0/4] USB: UDC: Fix memory leaks by expanding the API
Message-ID: <20200729202202.GA1584059@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fixes some long-standing memory leaks in the net2280 and 
net2272 drivers.  Along the way it expands the UDC/gadget API and 
addresses a stale pointer issue.

The real problem in net2280 and net2272 is that they need to do a bunch 
of cleanup operations using their private data structure after the 
gadget has been unregistered but before it is deallocated.  The current 
API does not offer any way to do this, nor any way to perform setup 
operations after the gadget is initialized but before it is registered.

Patch 2/4 fixes this by enlarging the API.  Using this new 
functionality, fixing the issues in the two UDC drivers is easy.

The stale pointer issue (patch 1/4) is related to the matter of 
re-registering a gadget multiple times, which is the subject of a 
separate email thread.

Alan Stern
