Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1B1C73FA33
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 12:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbjF0K2D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jun 2023 06:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbjF0K1m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jun 2023 06:27:42 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2CAC3A96
        for <linux-usb@vger.kernel.org>; Tue, 27 Jun 2023 03:26:44 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35RAQbhG083408;
        Tue, 27 Jun 2023 05:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1687861597;
        bh=08JrkADEPdO4e40d0NqjhzMgktfkOsC9kQAPcMqWZvk=;
        h=Date:From:To:CC:Subject;
        b=XaE54NxxuPsJcq6WhstqP5S8nRpOxlpWrsNkzgHznvSME3YVSswT94h3heluSc4n7
         cuvDRV6LyQXFahs839ND0+Q85j1lIFphIbXQzlHO1FLscYWpnUhSxBS0uV1O9UhVaZ
         nNBfN51rbPsGXuJ5dLK930T4dRCRmqUgcsFlDJpY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35RAQb9C010932
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 27 Jun 2023 05:26:37 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 05:26:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 05:26:36 -0500
Received: from [10.24.69.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35RAQYpA003105;
        Tue, 27 Jun 2023 05:26:35 -0500
Message-ID: <aa5837a9-8dd6-f10f-fd58-ec43e027ef07@ti.com>
Date:   Tue, 27 Jun 2023 15:56:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
From:   Ravi Gunasekaran <r-gunasekaran@ti.com>
To:     <Frank.Li@nxp.com>
CC:     <linux-usb@vger.kernel.org>, <peter.chen@kernel.org>,
        <pawell@cadence.com>, <rogerq@kernel.org>
Subject: usb: cdns3: Onchip memory reservation for built-in gadgets
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Firstly, I'm not sure if it is alright to post queries this way. 
If it is wrong, I apologize for it. Please let me know the right path/forum to ask the questions.

This is regarding the commit
dce49449e04f usb: cdns3: allocate TX FIFO size according to composite EP number

This commit introduced cdns3_gadget_check_config() which is invoked while binding gadget created via configfs and
also a logic to calculate ep_buf_size (which was CDNS3_EP_BUF_SIZE = 4).

But for gadgets such as g_ether, g_cdc, the checks are not performed. And also for these legacy gadget drivers,
memory needs to be reserved for multiple IN end points and shared memory for OUT end points. So when ep_buf_size = 15,
the memory reservation fails, as it exceeds total onchip memory.

So I was wondering if additional checks need to done in the cadence gadget driver or am I doing something wrong while
loading gadgets such as g_ether. 

-- 
Regards,
Ravi
