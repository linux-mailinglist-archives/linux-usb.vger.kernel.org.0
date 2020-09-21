Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D5E2722B6
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 13:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgIULhz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 07:37:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:45670 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726444AbgIULhz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 07:37:55 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600688274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc; bh=9jj1a7Y5iuO2Fuapz8cb4doylCc1dEU/JUi2sG59fQE=;
        b=oAAjjorUCZbey8mueh2Imrg7GceSs7HdX3AFs4zZs0Ag3MM+h8OHJ5fvNJLL3q8NCCpGVS
        uHM7rKem7IrX7CAXQdJR7BEb7BCjoo39GSmv3UUc6tANmHUCwmmy5FGodOTW254fb6UP0e
        S9b6uRQsJkV1maXQrnbs4l4cL/AjPaM=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2B6C4ACC2;
        Mon, 21 Sep 2020 11:38:30 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     keithp@keithp.com, linux-usb@vger.kernel.org
Subject: [RFT] implementation of O_NONBLOCK for chaoskey 
Date:   Mon, 21 Sep 2020 13:37:28 +0200
Message-Id: <20200921113732.11524-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This should implement O_NONBLOCK for chaoskey devices, but I need
a tester.

