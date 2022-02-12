Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9F754B313C
	for <lists+linux-usb@lfdr.de>; Sat, 12 Feb 2022 00:26:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354120AbiBKXZz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Feb 2022 18:25:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354103AbiBKXZy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Feb 2022 18:25:54 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC19ACEE;
        Fri, 11 Feb 2022 15:25:52 -0800 (PST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21BIuv6G015600;
        Fri, 11 Feb 2022 23:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=5R0nsiliDgL0ynUW40gdfiEgZXxp7s7CGGFe6zRPCfc=;
 b=M3rbcvnSSjA2N11naVIyEBLilMF8F66q3I5z/RIXOO3bJn8sved0enuTBWoQb4u6y8Nk
 5xj05F8KN4lTqHDjYT5Ut/0sNGWtvWWkuV7RYaOcc19/yhsE/G8tJ+URPm8y8zXZ8Rss
 6gGprkIYuNRYnzMrkdLLua/XzsXN4Gyoz2QtdJSDNKOAUvB7o9fVsxwNV2NWz/x4iY33
 BzVkCt7TLJqYcS+nyW9t4GazJSbrs7GZNgBNv7QjmsS95mwzZ2DVv6LJJRfYIIo5SA6D
 Uv7jzpBKbPDmLNiIgGF1MF19AJdm1iR/gPB+TyAJC33BRuwuVuiuB/Q7neshmR928xyz oA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3e5g98ace7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Feb 2022 23:25:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21BNG7nB020793;
        Fri, 11 Feb 2022 23:25:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 3e1jpykk3j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Feb 2022 23:25:34 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 21BNPTtF094578;
        Fri, 11 Feb 2022 23:25:33 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
        by userp3020.oracle.com with ESMTP id 3e1jpykk0v-4;
        Fri, 11 Feb 2022 23:25:33 +0000
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     linux-usb@vger.kernel.org,
        Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
        linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/2] Add scsi_done_direct() to complete request directly.
Date:   Fri, 11 Feb 2022 18:25:27 -0500
Message-Id: <164462189850.7606.17045798542627013831.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220201210954.570896-1-sebastian@breakpoint.cc>
References: <20220201210954.570896-1-sebastian@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4b-r61w-vgKInF0RZh4svTxDheC53G27
X-Proofpoint-ORIG-GUID: 4b-r61w-vgKInF0RZh4svTxDheC53G27
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 1 Feb 2022 22:09:52 +0100, Sebastian Andrzej Siewior wrote:

> This mini series adds scsi_done_direct() in order to complete scsi
> requests directly via blk_mq_complete_request_direct(). This used by the
> usb-storage driver.
> 
> Sebastian
> 

Applied to 5.18/scsi-queue, thanks!

[1/2] scsi: Add scsi_done_direct() for immediate completion.
      https://git.kernel.org/mkp/scsi/c/b84b6ec0f976
[2/2] usb: storage: Complete the scsi request directly.
      https://git.kernel.org/mkp/scsi/c/23fe075519c6

-- 
Martin K. Petersen	Oracle Linux Engineering
