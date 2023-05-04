Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203CF6F6D7D
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 16:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbjEDOFm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 10:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjEDOFk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 10:05:40 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 1F46546BB
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 07:05:38 -0700 (PDT)
Received: (qmail 414210 invoked by uid 1000); 4 May 2023 10:05:38 -0400
Date:   Thu, 4 May 2023 10:05:38 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Benjamin Block <bblock@linux.ibm.com>
Cc:     Oliver Neukum <oneukum@suse.com>, Hannes Reinecke <hare@suse.de>,
        Maxime Bizon <mbizon@freebox.fr>, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, linux-scsi@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: Reproducible deadlock when usb-storage scsi command timeouts
 twice
Message-ID: <83fac55c-4005-416d-aad7-04bcb3fcaea2@rowland.harvard.edu>
References: <ZEllnjMKT8ulZbJh@sakura>
 <34a2e50b-e899-45ee-ac14-31fa0bb1616b@rowland.harvard.edu>
 <20230503102440.GL18384@t480-pf1aa2c2.fritz.box>
 <941e8420-f99f-5832-2ea9-3ba5eca545ad@suse.com>
 <20230503125137.GA1032383@t480-pf1aa2c2.fritz.box>
 <d25bfa50-b5a0-bd0e-fd14-94967e374033@suse.com>
 <97a67f78-4888-4fe7-9bfc-87d0bb6cc8b2@rowland.harvard.edu>
 <20230504085226.GC1032383@t480-pf1aa2c2.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230504085226.GC1032383@t480-pf1aa2c2.fritz.box>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 04, 2023 at 08:52:26AM +0000, Benjamin Block wrote:
> On Wed, May 03, 2023 at 10:25:10AM -0400, Alan Stern wrote:
> > I think the best answer is to accept the patch that started this email 
> > thread, perhaps with a minor change.  The driver can easily abort the 
> > currently running command (if any) on its own before starting a reset.
> 
> I don't think we would add an other layer of aborts in front of
> device/LUN reset for all SCSI targets. That's just overkill for - it
> seems - everything but USB storage, and would slow down error recovery
> considerable in some cases.

This is consistent with what I wrote.  The patch that started this email 
thread made a change to the usb-storage driver; it did not touch any 
part of the SCSI core.

Maxime, would you like to submit a revised version of your patch?  The 
key difference is that it should abort the currently executing command 
(if there is one), regardless of whether the srb value matches.

Alan Stern

> If this is supposed to be done in the SCSI ML, it would have to be a
> quirk/option IMO.
> 
> -- 
> Best Regards, Benjamin Block        /        Linux on IBM Z Kernel Development
> IBM Deutschland Research & Development GmbH    /   https://www.ibm.com/privacy
> Vors. Aufs.-R.: Gregor Pillen         /         Gesch�ftsf�hrung: David Faller
> Sitz der Ges.: B�blingen     /    Registergericht: AmtsG Stuttgart, HRB 243294
