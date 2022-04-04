Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2074F1C3A
	for <lists+linux-usb@lfdr.de>; Mon,  4 Apr 2022 23:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346612AbiDDV0A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 17:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379177AbiDDQl2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 12:41:28 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DAE9245BD
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 09:39:32 -0700 (PDT)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AB2AC3F80A
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 16:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1649090363;
        bh=iHxNCKAQZOaPs1mR9VbcK+RH2Yxeo3Zi17R7fV/aSoc=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=JZYamW36u3FeVGI0Kilmv4VA2boGKZJ//0lEtfGaTRaDhj/uHAJfg0DMWuAxUul0z
         H54SAfbcR2Nz+zWFpCeUPsnSZSsHk3h+OS5ULPtHltJdC60qsfgxS5yNXS6h2RGxHD
         Nz2AYSp59oLrIyVCMoBtZSTJAMQXBIAOzKCHEezBzg3AweFDGccSsG9XNWK1L+SMU1
         wOX/dGZYpbh/WkPUUczfyth+FFS4da5ZPQlvZAUbJv2j/SN1sxs3/p5KZI576iJtaY
         p7BVFTtIwbZjdoZKrNme75fba+ReDFqCJ7GRMM0eUNkmPfQ990XZYa8tL9WK/wgi//
         Lv1pr25OFsZDw==
Received: by mail-pg1-f200.google.com with SMTP id q13-20020a638c4d000000b003821725ad66so5839108pgn.23
        for <linux-usb@vger.kernel.org>; Mon, 04 Apr 2022 09:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iHxNCKAQZOaPs1mR9VbcK+RH2Yxeo3Zi17R7fV/aSoc=;
        b=PoDN4jFbhxhOZxXRn5mz2aNvThcvj24sx2dhJbn+N5ENdEN7VvcUMyYRbFw4ivVKbW
         3npNgHG9if7Zqx2G9Q3BFh4oxK0EDy3XDIBMsVIe/Bsbmd3q7RCXZ4FmA4J9+uZ7Rwdp
         BFOLtVO2S9Y9JwPtrmsz8Vox0DIlkAZ7Y2I+S7QBzLiWh89xTLWLGV9aw1shkMvrL3pW
         8Y0BL9ctGqzCe09d+35qULYpv/xNrlKyC5cHS5diiPaO+6SZ8h95Idv3vf51enNwKHk6
         zmTKpnUQ7oHEOBWg3zCD1K8YbDE/PhL5ukYnGlHOmAzzogoVVcattiLDk6AdtAEQVBTz
         yQIg==
X-Gm-Message-State: AOAM531VYEFcl0uiS8N00oHInla+MpdHtCUo/YXLeuZhv/PyK7U0DH6c
        O4JdtCBc2nRVXvyRzR3nM94txnl7s1cmapdfTmVsiOu1TvDNdBCfiHmiPjpRFSge5Q2XRqpFtFX
        RdAkRSRsW2QNU4LftG0IlF+7Yh5EBgOgCtZ7UYg==
X-Received: by 2002:a17:903:11c7:b0:151:7290:ccc with SMTP id q7-20020a17090311c700b0015172900cccmr687111plh.95.1649090362024;
        Mon, 04 Apr 2022 09:39:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2ri87ZFirRD+uMXbSDmerXLRwvB/kYBk2lWhHrL1DyGZby68MzZ9boZeuRaqopEfUIx2cGg==
X-Received: by 2002:a17:903:11c7:b0:151:7290:ccc with SMTP id q7-20020a17090311c700b0015172900cccmr687077plh.95.1649090361668;
        Mon, 04 Apr 2022 09:39:21 -0700 (PDT)
Received: from luke-ubuntu.buildd (cpe-66-27-118-101.san.res.rr.com. [66.27.118.101])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a00230a00b004faa0f67c3esm12250250pfh.23.2022.04.04.09.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 09:39:21 -0700 (PDT)
From:   Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
To:     linux-usb@vger.kernel.org
Cc:     hdegoede@redhat.com, mathias.nyman@linux.intel.com,
        chris.chiu@canonical.com, stern@rowland.harvard.edu, kishon@ti.com
Subject: Deferring xhci primary roothub registration
Date:   Mon,  4 Apr 2022 09:38:39 -0700
Message-Id: <20220404163839.19102-1-luke.nowakowskikrijger@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

There have been some users using Ubuntu 5.4 based kernels with certain intel xHCI controllers that are experiencing USB devices not being detected during boot [4][5].
This problem seems to have been reintroduced after the patchset that deferred primary roothub registration to address device enumeration before
xHC is running was reverted due to regressions [1][2].

My question is if there has been any efforts to reintroduce these patches or any other fixes that I am not aware of to address the original problem [3]?
There seem to have been many bug fixes addressing the problems referenced in the original regression report [2] to do with this patch series,
is there anything in the way of reintroducing these patches? From only looking at the mailing list discussions and various bug reports, I still am not exactly
sure what the problems with these patches were in the first place.

Anyways, these things seem pretty tricky and I would appreciate any insight on the matter :)

Thanks,
- Luke

[1] https://lore.kernel.org/all/20211104141158.561738875@linuxfoundation.org/
[2] https://lore.kernel.org/all/42bcbea6-5eb8-16c7-336a-2cb72e71bc36@redhat.com/
[3] https://bugzilla.kernel.org/show_bug.cgi?id=214021
[4] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1939638
[5] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1945211
