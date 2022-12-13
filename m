Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6948064BDFF
	for <lists+linux-usb@lfdr.de>; Tue, 13 Dec 2022 21:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236163AbiLMUiy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Dec 2022 15:38:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236684AbiLMUiw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Dec 2022 15:38:52 -0500
Received: from mx0a-00445d01.pphosted.com (mx0a-00445d01.pphosted.com [205.220.171.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445A61401C
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 12:38:52 -0800 (PST)
Received: from pps.filterd (m0303598.ppops.net [127.0.0.1])
        by mx0a-00445d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BDJJxcG004690
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 15:38:52 -0500
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by mx0a-00445d01.pphosted.com (PPS) with ESMTPS id 3meyf2g1mv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 15:38:51 -0500
Received: by mail-io1-f70.google.com with SMTP id s22-20020a6bdc16000000b006e2d7c78010so2638584ioc.21
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 12:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bostondynamics.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zwl3TUvo1XMGs8XbUX2F286NetWn3ZYzuIGYPzxCS+w=;
        b=O6lNy+uf+uKPdba1w1Q8+Pi5V59d/LATaentdxvT2xHkCc1Td8iff624LskSS8TSk1
         B9nB//iZmcSQRty3p8HAQ52sC894ThAfEWEyCc9DWs27l6q1YoHwFrLooQzxCaPfV07h
         U9/NVvLtd8Fy2z+PdMDRmmBwWRrFO1ptHpll0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zwl3TUvo1XMGs8XbUX2F286NetWn3ZYzuIGYPzxCS+w=;
        b=4pxSRXMP4r3QKCXqIXvkKYFfmPuzAzt++P0k02nGyrjuCnopI6XGEg/NJsWabdwj7H
         T9eEcC2CC0b1++nYzrirk4OuB0zRij1Ug0aLZRe2UjSbp9j1sDVLHKA0GzdAPWfMTEDZ
         e6X2FcEZ4LoIZQm4K42itEEwtybwG3AFWDrt8r6KC5HqxgaS4eIYcVBQRnCxK/NUxsBB
         A05YmI1zKR1VWplrQ0pMs5H++zeeGnzUx0DhdYoV/tzitFDRG9Alk+0z8aP8ZTXQefDN
         uf6bcBbzGuTqbeRhqj5IzJKCc6lS5uvDeeI/d05pF1bkUoQAM+G0rx6+5pp/Uxs2M0dw
         icHQ==
X-Gm-Message-State: ANoB5pn3DJdoVgLqDXd3yJKon1lzOL4O+JbE57mjUEuo2UMjTliF+fli
        uib0OtBqgggiT5hSuZT9ihs5iU1EylIPGTzhIbyJDHKkdfMODBuOJf7g0gGOWFb8tZn1hHSm+Qm
        SolqKkjLf0qTI/4qFX97a3Eeyiz4dIMZkJ+uI
X-Received: by 2002:a92:d5d2:0:b0:303:afb:a990 with SMTP id d18-20020a92d5d2000000b003030afba990mr26647589ilq.79.1670963930619;
        Tue, 13 Dec 2022 12:38:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5cAFAfR4AaYh1S8OHNrkrBye9SV85SFa+ML8WMPzfcIyPIMFf+t7YkYKeRaxXR/FZfl/YW/hcXVxzdUWbti38=
X-Received: by 2002:a92:d5d2:0:b0:303:afb:a990 with SMTP id
 d18-20020a92d5d2000000b003030afba990mr26647587ilq.79.1670963930372; Tue, 13
 Dec 2022 12:38:50 -0800 (PST)
MIME-Version: 1.0
References: <CAHPEz-19mAZ9FPvzZ997i_qhJRN3EC4eo=4yRAR5hTCqq0QSMw@mail.gmail.com>
In-Reply-To: <CAHPEz-19mAZ9FPvzZ997i_qhJRN3EC4eo=4yRAR5hTCqq0QSMw@mail.gmail.com>
From:   Joe Bolling <jbolling@bostondynamics.com>
Date:   Tue, 13 Dec 2022 15:38:39 -0500
Message-ID: <CAHPEz-36=k7QURQCjaK80tW93gchL7KoZszkZZ+HUCWRuoP1Kw@mail.gmail.com>
Subject: Error 110 from ASMedia Host Controller
To:     linux-usb@vger.kernel.org
Cc:     Alex Khripin <akhripin@bostondynamics.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 4PDMMZdgbaWDf2LJoXYlAGjlhF4FMs3N
X-Proofpoint-ORIG-GUID: 4PDMMZdgbaWDf2LJoXYlAGjlhF4FMs3N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi there -

I'm seeing a failure from XHCI_HCD when I stream video from Intel
Realsense cameras through an ASMedia ASM3042 USB host controller. The
issue usually manifests as repeated Error 110s from the camera as long
as I'm trying to stream data:
[  100.227800] usb 4-1: Failed to query (SET_CUR) UVC control 1 on
unit 3: -110 (exp. 1024).
Followed by a bit of a lockup from XHCI_HCD. lsusb will hang and I
can't get any image data from the camera.
I've observed this in the following conditions:

-I've reproduced the problem on kernel 6.0.11 and 6.1.0-rc8, as well
as every older kernel I've tried (5.13 and 4.15)
-It seems to happen sooner when there are multiple cameras connected
and streaming. In the attached logs, I'm streaming from four cameras,
two via an ASM3042 and two via an Intel host controller
-It seems to happen when I stop and re-start streaming from the
cameras repeatedly

You can find the kernel trace and dmesg output here:
https://bostondynamics1.box.com/s/qtn28it8avda6pvve5sowyaeff4jzlyr
Please let me know if I can provide any other information; I do have a
USB 3.0 analyzer, and I can provide traces from it if helpful.

Thanks,
Joe Bolling
