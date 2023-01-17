Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D86666DF49
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jan 2023 14:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbjAQNtZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 08:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbjAQNtO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 08:49:14 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4185A360B9
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 05:49:13 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so4743673wmb.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 05:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vgjmjcKuXP3RoqqniCwReaFJ8sbKhLTf3w6njJyfS3U=;
        b=ecY8MvSoQ8WaCJQVXClFyQcsZwg1Ij+M47VnehIjTzJM5Fyno8OXmBJFjn40Y+J4YR
         B82e/l/mSewmDiPoO3pkK943pBc94P0kwfEcQv67xdHc3x5Nh/rGWITBoA7hBbJyE5B9
         xBzNYVbh3e3kVM7q1jvnMC3XTsAwhgwXsQ4tfrzUVTcdH13XKVpQxn2pp3TYoisP4/1I
         jp7dECxY3UAyKQ/kRZ8OlUe936VNNenpwIG1wYm5frQI95+K8oTNTJYY0o8LQHh9k24y
         E3EqLBbu2L3rUua2WufaWxyV2Yll5fFEmLwp5Lhjh437XyeC/KkOR/R+pNN+4bbp8s1K
         TAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgjmjcKuXP3RoqqniCwReaFJ8sbKhLTf3w6njJyfS3U=;
        b=k8O7UuIoGlffqqHExTDTvLaQjLweFUmIAdaXKGFKTWFSbczP0gdnesbT+MNcFwILU6
         NRvKzL0rs2QA1BAuKPMniFSGnkWBg8VuoCPc6/xCyHvcxQE33jBeSYbTi3lYGIC378+r
         unoTFt83KSU+Auvn1uaROOOyyDKFEPnJcp6DyB80r6tEIzC/yj8ajnRqMDnKTasyGa7r
         s35U/39LwXSnR1pkrq6tu+tij7Q835KmqWURkp8QOLBY+BygSg20hkIhx0lnIY5kBUHx
         7XVlFc5DzIDFTp6CT1QF3OQ2u3H7JSiFGW/KDo6duAVaJcijjIIvg0GYnGtw5a1Eo5tZ
         Ka6A==
X-Gm-Message-State: AFqh2krQl7Nsq/os8SRa0dTI/TC9deWKm02wSsmFyBu81Q5d//QAcpej
        m6kDNsxsft5UX8NA/4cn3n9FsCWtAtc=
X-Google-Smtp-Source: AMrXdXsNXyRVA0yADmlzeKRnTgMGPsOCbsnp8CcpytzIqQ99WfjQ+fJ6ulooOq3ym9w9Om2YJUJR0g==
X-Received: by 2002:a1c:f40a:0:b0:3c6:e62e:2e74 with SMTP id z10-20020a1cf40a000000b003c6e62e2e74mr11917533wma.15.1673963351545;
        Tue, 17 Jan 2023 05:49:11 -0800 (PST)
Received: from DESKTOP-53HLT22 ([39.42.178.198])
        by smtp.gmail.com with ESMTPSA id bh13-20020a05600c3d0d00b003d358beab9dsm36725563wmb.47.2023.01.17.05.49.10
        for <linux-usb@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 17 Jan 2023 05:49:10 -0800 (PST)
Message-ID: <63c6a756.050a0220.4febd.4ab6@mx.google.com>
Date:   Tue, 17 Jan 2023 05:49:10 -0800 (PST)
X-Google-Original-Date: 17 Jan 2023 08:50:46 -0500
MIME-Version: 1.0
From:   archiefederico530@gmail.com
To:     linux-usb@vger.kernel.org
Subject: Any Drawings for Estimate?
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=0D=0AHi,=0D=0A=0D=0ADo you have any estimating projects for us=0D=0A=
=0D=0AIf you are holding a project, please send over the plans in=
 PDF format for getting a firm quote on your project.=0D=0A=0D=0A=
Let me know if you have any questions or if you would like to see=
 some samples.=0D=0A=0D=0AWe will be happy to answer any question=
s you have. Thank you=0D=0A=0D=0ARegards,=0D=0AArchie Federico=0D=0A=
Crossland Estimation, INC

