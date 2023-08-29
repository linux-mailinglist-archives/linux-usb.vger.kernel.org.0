Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 923B778D0B3
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 01:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241175AbjH2XnP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Aug 2023 19:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241199AbjH2Xmy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Aug 2023 19:42:54 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id E893B1B1
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 16:42:51 -0700 (PDT)
Received: (qmail 404774 invoked by uid 1000); 29 Aug 2023 19:42:51 -0400
Date:   Tue, 29 Aug 2023 19:42:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "zdi-disclosures@trendmicro.com" <zdi-disclosures@trendmicro.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ZDI-CAN-22042: New Vulnerability Report
Message-ID: <35fdc897-fb84-4d96-a445-9a17e17d0e5f@rowland.harvard.edu>
References: <DM5PR0102MB3477A5BBF521F22F6ED1694E80E7A@DM5PR0102MB3477.prod.exchangelabs.com>
 <DM5PR0102MB347745E2B47C9AD24F379CF880E7A@DM5PR0102MB3477.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM5PR0102MB347745E2B47C9AD24F379CF880E7A@DM5PR0102MB3477.prod.exchangelabs.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 29, 2023 at 08:54:06PM +0000, zdi-disclosures@trendmicro.com wrote:
> The attachment could not be scanned for viruses because it is a password protected file.
> ZDI-CAN-22042: Linux Kernel USB Core Out-Of-Bounds Read Local Privilege Escalation Vulnerability
> 
> -- CVSS -----------------------------------------
> 
> 7.1: AV:P/AC:H/PR:N/UI:N/S:C/C:H/I:H/A:H
> 
> -- ABSTRACT -------------------------------------
> 
> Trend Micro's Zero Day Initiative has identified a vulnerability affecting the following products:
> Linux - Kernel
> 
> -- VULNERABILITY DETAILS ------------------------
> * Version tested:6.5-rc7
> * Installer file:-
> * Platform tested:debian bullseye
> 
> ---
> 
> ### Analysis
> 
> ``` usb_destroy_configuration() didn't consider/validate the updated 
> USB descriptor it leads to out-of-bounds access in 
> usb_destroy_configuration() it would call kfree() on a pointer that is 
> read from out-of-bounds it would be triggered physically the build 
> config is from syzbot's ci-qemu-upstream ```
> 
> ~~~C++
> int usb_get_configuration(struct usb_device *dev) {
>         struct device *ddev = &dev->dev;
>         int ncfg = dev->descriptor.bNumConfigurations;
>         unsigned int cfgno, length;
>         unsigned char *bigbuffer;
>         struct usb_config_descriptor *desc;
>         int result;
> 
>         if (ncfg > USB_MAXCONFIG) {
>                 dev_notice(ddev, "too many configurations: %d, "
>                     "using maximum allowed: %d\n", ncfg, USB_MAXCONFIG);
>                 dev->descriptor.bNumConfigurations = ncfg = USB_MAXCONFIG;
>         }
> 
>         if (ncfg < 1) {
>                 dev_err(ddev, "no configurations\n");
>                 return -EINVAL;
>         }
> 
>         length = ncfg * sizeof(struct usb_host_config);
>         dev->config = kzalloc(length, GFP_KERNEL);
>         if (!dev->config)
>                 return -ENOMEM;
> 
>         length = ncfg * sizeof(char *);
>         dev->rawdescriptors = kzalloc(length, GFP_KERNEL);              // (1) at the beginning, length is 8, ncfg is 1
> ...
> }
> 
> static int sd_config(struct gspca_dev *gspca_dev,
>                         const struct usb_device_id *id)
> {
>         struct sd *sd = (struct sd *)gspca_dev;
>         struct cam *cam = &gspca_dev->cam;
>         u8 *cd = gspca_dev->usb_buf;
>         int i, j, n;
>         int widths[MAX_MODES], heights[MAX_MODES];
> 
>         /* Read the camera descriptor */
>         se401_read_req(gspca_dev, SE401_REQ_GET_CAMERA_DESCRIPTOR, 1);
>         if (gspca_dev->usb_err) {
>                 /* Sometimes after being idle for a while the se401 won't
>                    respond and needs a good kicking  */
>                 usb_reset_device(gspca_dev->dev);                                       // (2) if usb_reset_device() is called, the dev->descriptor will be updated from USB

This should be fixed by the following commits in linux-next:

	85d07c556216, de28e469da75, ff33299ec8bb, 59cf44575456

(particularly the third one).  Presumably these will be added into 
6.6-rc1 during the current merge window and then back-ported to the 
stable kernels.

Alan Stern
