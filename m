Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0248964A4B5
	for <lists+linux-usb@lfdr.de>; Mon, 12 Dec 2022 17:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbiLLQY6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Dec 2022 11:24:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbiLLQY5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Dec 2022 11:24:57 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id E59A5B48B
        for <linux-usb@vger.kernel.org>; Mon, 12 Dec 2022 08:24:55 -0800 (PST)
Received: (qmail 857185 invoked by uid 1000); 12 Dec 2022 11:24:55 -0500
Date:   Mon, 12 Dec 2022 11:24:55 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Gerald Lee <sundaywind2004@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb: A use-after-free Write in put_dev
Message-ID: <Y5dV11OoM3ojxNHy@rowland.harvard.edu>
References: <CAO3qeMVzXDP-JU6v1u5Ags6Q-bb35kg3=C6d04DjzA9ffa5x1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO3qeMVzXDP-JU6v1u5Ags6Q-bb35kg3=C6d04DjzA9ffa5x1g@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 12, 2022 at 04:07:43PM +0800, Gerald Lee wrote:
> Hi, all
> 
> I found a vulnerability when fuzzing linux kernel by syzkaller. The
> KASAN reports that use-after-free Write in put_dev. Then I tried to
> reproduce and got the C source file. I compiled it and executed the
> binary program, but the kernel crashed as expected. This vulnerability
> could be used to LPE as UAF, I thought.

I think this use-after-free violation is caused by a race among the
superblock operations in the gadgetfs driver.  Please try running your
test after applying the patch below, to see if it fixes the problem.

Alan Stern


--- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
+++ usb-devel/drivers/usb/gadget/legacy/inode.c
@@ -229,6 +229,7 @@ static void put_ep (struct ep_data *data
  */
 
 static const char *CHIP;
+static DEFINE_MUTEX(sb_mutex);		/* Serialize superblock maintenance */
 
 /*----------------------------------------------------------------------*/
 
@@ -2010,13 +2011,20 @@ gadgetfs_fill_super (struct super_block
 {
 	struct inode	*inode;
 	struct dev_data	*dev;
+	int		rc;
 
-	if (the_device)
-		return -ESRCH;
+	mutex_lock(&sb_mutex);
+
+	if (the_device) {
+		rc = -ESRCH;
+		goto Done;
+	}
 
 	CHIP = usb_get_gadget_udc_name();
-	if (!CHIP)
-		return -ENODEV;
+	if (!CHIP) {
+		rc = -ENODEV;
+		goto Done;
+	}
 
 	/* superblock */
 	sb->s_blocksize = PAGE_SIZE;
@@ -2053,13 +2061,17 @@ gadgetfs_fill_super (struct super_block
 	 * from binding to a controller.
 	 */
 	the_device = dev;
-	return 0;
+	rc = 0;
+	goto Done;
 
-Enomem:
+ Enomem:
 	kfree(CHIP);
 	CHIP = NULL;
+	rc = -ENOMEM;
 
-	return -ENOMEM;
+ Done:
+	mutex_unlock(&sb_mutex);
+	return rc;
 }
 
 /* "mount -t gadgetfs path /dev/gadget" ends up here */
@@ -2081,6 +2093,7 @@ static int gadgetfs_init_fs_context(stru
 static void
 gadgetfs_kill_sb (struct super_block *sb)
 {
+	mutex_lock(&sb_mutex);
 	kill_litter_super (sb);
 	if (the_device) {
 		put_dev (the_device);
@@ -2088,6 +2101,7 @@ gadgetfs_kill_sb (struct super_block *sb
 	}
 	kfree(CHIP);
 	CHIP = NULL;
+	mutex_unlock(&sb_mutex);
 }
 
 /*----------------------------------------------------------------------*/
