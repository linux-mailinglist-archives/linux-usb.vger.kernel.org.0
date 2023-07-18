Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1A6758027
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jul 2023 16:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbjGROxW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jul 2023 10:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbjGROxU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jul 2023 10:53:20 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id E04D6A4
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 07:53:17 -0700 (PDT)
Received: (qmail 1608754 invoked by uid 1000); 18 Jul 2023 10:53:16 -0400
Date:   Tue, 18 Jul 2023 10:53:16 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com
Subject: Re: [PATCH 2/2] usb: ehci: unlink itd/sitds from hardware list if
 the controller has stopped periodic schedule
Message-ID: <52e62d2e-a82a-4c9f-86ce-3ddad3efffb5@rowland.harvard.edu>
References: <20230718112600.3969141-1-xu.yang_2@nxp.com>
 <20230718112600.3969141-2-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718112600.3969141-2-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 18, 2023 at 07:26:00PM +0800, Xu Yang wrote:
> In current design, the ehci driver will not unlink itd/sitds from the
> hardware list when dequeue isochronous urbs. Rather just wait until they
> complete normally or their time slot expires. However, this will cause
> issues if the controller has stopped periodic schedule before finished
> all periodic schedule. The urb will not be done forever in this case and
> then usb_kill/poison_urb() will always wait there.
> 
> The ChipIdea IP exactly has a bug: if frame babble occurs during periodic
> transfer, PE (PORTSC.bit2) will be cleared and the controller will stop
> periodic schedule immediately. So if the user tries to kill or poison
> related urb, it will wait there since the urb can't be done forever.
> 
> This patch will check if this issue occurs, then it will unlink itd/sitds
> from the hardware list depends on the result.

This is not the right approach.  There already is code in the driver for 
unlinking itds/sitds when the periodic schedule isn't running: See how 
the "live" variable is used in scan_isoc().  You don't need to add new 
code to do the same thing, you simply have to make sure that live is set 
to false if the controller has stopped the periodic schedule 
unexpectedly.

(Be very careful about handling the case where CMD_PSE is set and 
STS_PSS is clear.  This can happen when the controller has been told to 
start the periodic schedule but it hasn't done so yet.)

Alan Stern
