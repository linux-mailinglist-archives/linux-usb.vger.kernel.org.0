Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07BE95FB81
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 18:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbfGDQGh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 12:06:37 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56475 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725865AbfGDQGh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jul 2019 12:06:37 -0400
Received: (qmail 19624 invoked by uid 500); 4 Jul 2019 12:06:36 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 4 Jul 2019 12:06:36 -0400
Date:   Thu, 4 Jul 2019 12:06:36 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     EJ Hsu <ejh@nvidia.com>
cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        WK Tsai <wtsai@nvidia.com>
Subject: RE: [PATCH V3] usb: gadget: storage: Remove warning message
In-Reply-To: <BN7PR12MB26449A2DC32EC2767CBF6687CFFA0@BN7PR12MB2644.namprd12.prod.outlook.com>
Message-ID: <Pine.LNX.4.44L0.1907041204570.18767-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 4 Jul 2019, EJ Hsu wrote:

> Based on my initial debugging, USB CV TD 9.13 will consecutively set device to configuration #1 by sending "Set Configuration" transfer.
> So, in set_config() function, it will try to disable each interface first and then set up each interface. That is, the fsg_disable() will be called first and then fsg_set_alt().
> There might be a chance that the request (FSG_STATE_DISCONNECT) from fsg_disabled() has not been handled by fsg_main_thread before fsg_set_alt() is called.
> In this case, fsg_set_alt() will try to queue its request (FSG_STATE_CONFIG_CHANGE) to fsg_main_thread, but find that FSG_STATE_DISCONNECT has not been handled.
> Because the priority of FSG_STATE_DISCONNECT is higher than FSG_STATE_CONFIG_CHANGE, FSG_STATE_CONFIG_CHANGE will be discarded accordingly.
> This might lead to the missing of usb_composite_setup_continue() which result in the failure of "Set Configuration" transfer.
> 
> Will push a new patch to fix this issue.

Have you seen these emails?

	https://marc.info/?l=linux-usb&m=156222739324546&w=2
	https://marc.info/?l=linux-usb&m=156222747024558&w=2

They are probably related to this same issue.

Alan Stern

