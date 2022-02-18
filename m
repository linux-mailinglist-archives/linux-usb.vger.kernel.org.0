Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCB14BBFF2
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 19:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234757AbiBRSvb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 13:51:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbiBRSv2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 13:51:28 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB1D4F9D1
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 10:51:11 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id w63so52684ybe.10
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 10:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=O0sM+7/S+fBCCZUg+/YEGNIX6w68DP/DhEZWAgILhyI=;
        b=Cj7dGSeyB4hwreR941XOTfCnwxfccJ6bT6Saa+jXyT+t0uLcjJVPUrkeglx8/nJlxA
         ha+h94Orleiir6L3qt0bkssXF3Ztql5yIOQ70+u9yMq0hXXtq1CfZ9jJfNBYw+3T2y8i
         Mxu9YKUUGVNjT/uv/k47hdUpMFClnltwF5GNlGnnxbn3RNjxaQxhwuFiqVkWRi+TXCk1
         VUv/k1nZ/FW4MdMKfNDDukqE5H+JU4YOIfrX0ZE71j9ZV0vslnQ61KdKa4Nf7t2p8jI7
         NiL2NfEGH8eHdJUdVBugRDMK3CwR1GeTnQVshGqgbRMuLuFggoZ4RdqeifMYRRWJCydS
         aGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=O0sM+7/S+fBCCZUg+/YEGNIX6w68DP/DhEZWAgILhyI=;
        b=cF5m+F3gZLhsjD1HY/rQ5Pr4Lu4LtI/HGjBUz+d6FJsrKI8olCr4nHx8A6aT4W/c9S
         5MPPoWi7ivIrU8GCXhAiX3fj7Jy5n2na4b0pzUlV+6bkk7DLVPCJmjbY8Sxri+mZ1PZN
         sm5cPZ1rOxVWqe/puucTGouon+Ba3ZgZjHzhi3UxEk8iRf3S4fjPiIXUT226SVofsMXt
         01bkWbN856KA4O3dAAZtE1cR6SRFPLccW78n2bI7hF/06gYjZdFOQIAIM2ZcQ5zM1YTf
         lzT6WmRBIiZvujITEnodJJln0VADzGFAtXPE2TdoF2+NLitrXwTS7nFjOp+Xhixd6J+d
         IliA==
X-Gm-Message-State: AOAM5302HTMsma32r6zaaiQNT+iPNoYkeVlcBKyylmlSJHIxTxIwIWGS
        o1oWkuZ1goczdd09FzWvjuuO0T7ePo5qZ+niNLM=
X-Google-Smtp-Source: ABdhPJzo3YZqYryg/tPOb2hYftZDMiI2C+tHNgXUsFwRro4lLDX2YSwdXeU8LrV0UYkfXpO5OMZfp72o5aBIm2iRCwg=
X-Received: by 2002:a25:545:0:b0:623:a41a:7263 with SMTP id
 66-20020a250545000000b00623a41a7263mr8570045ybf.163.1645210271021; Fri, 18
 Feb 2022 10:51:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6900:2a8a:0:0:0:0 with HTTP; Fri, 18 Feb 2022 10:51:10
 -0800 (PST)
Reply-To: jeai2nasri@yahoo.com
From:   james nasri <jamesnassri@gmail.com>
Date:   Fri, 18 Feb 2022 18:51:10 +0000
Message-ID: <CAHCfg3RJva9z4J1JmwHciGydZ+qKRZXGFfhRk49aWaO6VoO_gA@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello
Do you have an account to receive donation money? Please reply for
further explanation
Nasri
