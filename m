Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB92FC548
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2019 12:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfKNL2J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Nov 2019 06:28:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:52698 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726613AbfKNL2J (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Nov 2019 06:28:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 93EDEB20F;
        Thu, 14 Nov 2019 11:28:08 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: cleanup capacity flag handling in UAS
Date:   Thu, 14 Nov 2019 12:27:55 +0100
Message-Id: <20191114112758.32747-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series intends to bring UAS up to storage in terms
of handling flags for capacity quirks as far as that is applicable.
In addition it documents which driver handles which flag.

