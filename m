Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D538465CF66
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 10:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238937AbjADJT6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 04:19:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239020AbjADJTd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 04:19:33 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A7D1CFDF
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 01:19:32 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id k19so14689831pfg.11
        for <linux-usb@vger.kernel.org>; Wed, 04 Jan 2023 01:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MXTJgLuQHLsc/r6DrziVqRruhwpWIqmRRijuUHnfBJo=;
        b=a1aglTiqOJStHgb2X0/wvRHK57BRQUxFp7FFVmqtTXyPuQ9LhtrAJmDrmeqX+eBq4t
         ZcLB+fGn0F7Hj1mv2TITb2SzEz8cQHQ846yBX6d7RrY5D22j2PdkiueZE6bQ58PYBnJp
         9yZ16FmcGwP1fbnpf1HmUM3HABN7BNuHAQBTMfiWMaxv/DhlVdE4dkJPmKDO328RFRwM
         hYyZmhL0Iqws23QH1NjeZXtuyTvh8wwAdTEd0HYpxtPhiNHTIwTVTap8aO+/bnQ5m8xl
         dJwiYx0OqXvCR3KQVgr5xpyy6RtPmEpGxCaCzafVeQOKVzavE5vKYkXjtxTLktbDyJ32
         DwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXTJgLuQHLsc/r6DrziVqRruhwpWIqmRRijuUHnfBJo=;
        b=6+f0HLeDjBPoHnrXy1Dd261gpk2zkKxgWxt674k1fWXjsjCYZU9k781DcZjWecbKVL
         f9OoSmMPTrUnR96tPCufRjxUlvpW4TvsaPNzBLcpI5mi71E09atpLh+bqgvvqwG8wU2B
         m0FXl3afQqE7HvP+Un97ENXQFO1hS/ixKWnVo+GQ9/zgXWSvVLGQFVzucbqKHKp2+crT
         8Xa3SSF+xdIPCCYPxaj9+WW5etzZ5Ww2THNzVi4wIGhplOl4TQCoQmSBHmXCRT78xhYn
         1DSq3ltZ6ECy05duAQx33zcVeu/lZyDbk+nFeeQMNXq+qo02LjWR0b5OisE9NtgFFi1S
         X8uA==
X-Gm-Message-State: AFqh2kpMc3twWGmQWJfSjOG8cs3OThoJi3V+cHh9WGhrc1cNBzgqXkx5
        lIY8sgFLal/gExfMVpEOqRePhA==
X-Google-Smtp-Source: AMrXdXtyeky7DMsUhAK+gve9qba6t19SjGsYhc+TS/gVSficRnlxHg2naMljpQLa8SMaZ/52/hcVgw==
X-Received: by 2002:a05:6a00:1747:b0:582:7d41:c8a4 with SMTP id j7-20020a056a00174700b005827d41c8a4mr13639805pfc.15.1672823971646;
        Wed, 04 Jan 2023 01:19:31 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c5e:e3b5:c341:16de:ce17:b857])
        by smtp.gmail.com with ESMTPSA id b189-20020a621bc6000000b00580d877a50fsm19205877pfb.55.2023.01.04.01.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 01:19:31 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     quic_schowdhu@quicinc.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 0/2] Fix EUD dt-binding doc & sc7280 EUD node syntax 
Date:   Wed,  4 Jan 2023 14:49:20 +0530
Message-Id: <20230104091922.3959602-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patchset fixes the EUD dt-binding doc & sc7280 EUD node syntax.

Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>

Bhupesh Sharma (2):
  arm64: dts: qcom: sc7280: Fix EUD dt node syntax
  dt-bindings: soc: qcom: eud: Fix identation issues in the example

 .../bindings/soc/qcom/qcom,eud.yaml           |  8 +++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 32 ++++++++++++-------
 2 files changed, 25 insertions(+), 15 deletions(-)

-- 
2.38.1

