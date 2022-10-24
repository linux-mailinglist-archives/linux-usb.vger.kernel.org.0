Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71EB0609E39
	for <lists+linux-usb@lfdr.de>; Mon, 24 Oct 2022 11:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbiJXJqh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Oct 2022 05:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbiJXJqU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Oct 2022 05:46:20 -0400
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02037647D
        for <linux-usb@vger.kernel.org>; Mon, 24 Oct 2022 02:45:58 -0700 (PDT)
X-Virus-Scanned: Yes
Message-ID: <2aa47149-15a7-16f4-aa01-b5dca0af69ad@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1666604423;
        bh=TNSgsgA8Ev/imkhyyzBHw6C3mnPIhJz3J9QZ/75EzgQ=;
        h=To:Cc:From:Subject;
        b=C8c6+LzjQo0bFOiRRyZIHz9IGVthOiZUs/2ZWBY7vJOjByKMGOgxrLa31qmarg8Sj
         4t2frCK0La3yBemIIa+O/rvnZe9r+/9UBrFtstoDFsx42dkupoa/yi7aNxIxarEb2N
         wDhQHOSFKz2yFe+xyZfV25T2yWeY8iJ8+GENzlS3brwDXkr2kkorajK8hqaAOkFljq
         bTb5z3foYlkoeMUwXfbhESrdfYHAHi5CJ91TF1Ik1zP8FkgnEC1jwkSdRla1ZHXfx7
         eHEvie5wJ+Hr72ocGEymGSGQviq7HpOINVdWz78o0hod8sQUXLtVZ61SqFHRLzXMhp
         pvofdPk3OFhvQ==
Date:   Mon, 24 Oct 2022 11:40:22 +0200
Mime-Version: 1.0
Content-Language: en-US
To:     linux-usb@vger.kernel.org
Cc:     Peter.Chen@nxp.com
From:   Sven Schwermer <sven@svenschwermer.de>
Subject: How do disable VBUS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I have an embedded system built around an NXP i.MX6ULL SoC. Within that 
system, there is a USB device that's hooked up to USBOTG2 (chipidea 
driver) of the SoC. This USB OTG peripheral is statically set to host 
mode in the device tree. The USB device is powered by a separate supply 
in addition to the VBUS supply. Now I want to make sure that VBUS is 
switched off whenever I switch off the main power supply. I have started 
to write a little platform driver which will do the sequencing. However, 
I'm struggling to find a way to switch off the VBUS supply given a 
struct device* handle which I have managed to get. Is there an API that 
I can use? I have confirmed that unbinding the driver via sysfs does 
achieve this, however, how do I do this programmatically from kernel 
code, perhaps without unbinding the entire device?

Best regards,
Sven
