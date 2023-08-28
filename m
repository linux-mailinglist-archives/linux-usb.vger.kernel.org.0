Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD7278BA71
	for <lists+linux-usb@lfdr.de>; Mon, 28 Aug 2023 23:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjH1Vt0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Aug 2023 17:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234027AbjH1VtY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Aug 2023 17:49:24 -0400
Received: from mp-relay-01.fibernetics.ca (mp-relay-01.fibernetics.ca [208.85.217.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C0A1A6
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 14:49:13 -0700 (PDT)
Received: from mailpool-fe-02.fibernetics.ca (mailpool-fe-02.fibernetics.ca [208.85.217.145])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mp-relay-01.fibernetics.ca (Postfix) with ESMTPS id E5F42E16C7
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 21:49:12 +0000 (UTC)
Received: from localhost (mailpool-mx-02.fibernetics.ca [208.85.217.141])
        by mailpool-fe-02.fibernetics.ca (Postfix) with ESMTP id DC1D760BB9
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 21:49:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Score: -0.2
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
Received: from mailpool-fe-02.fibernetics.ca ([208.85.217.145])
        by localhost (mail-mx-02.fibernetics.ca [208.85.217.141]) (amavisd-new, port 10024)
        with ESMTP id HvX7SRt0R81f for <linux-usb@vger.kernel.org>;
        Mon, 28 Aug 2023 21:49:12 +0000 (UTC)
Received: from [192.168.48.17] (host-104-157-193-42.dyn.295.ca [104.157.193.42])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dgilbert@interlog.com)
        by mail.ca.inter.net (Postfix) with ESMTPSA id 681CD604BA
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 21:49:12 +0000 (UTC)
Message-ID: <2d9957c7-1f23-fd5b-9aa1-6d171c3f83c7@interlog.com>
Date:   Mon, 28 Aug 2023 17:49:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To:     linux-usb@vger.kernel.org
Reply-To: dgilbert@interlog.com
Content-Language: en-CA
From:   Douglas Gilbert <dgilbert@interlog.com>
Subject: RFC: lsucpd for listing typec and USB-C PD information
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The lsucpd command line utility will list local USB-C ports (e.g. each
female USB-C connector on a laptop) with one line output for each port.
Note that not all USB-C ports support PD. For those ports that do support
PD that are also connected to another USB-C PD device, a "port<n>-partner"
is shown to the right of each line output by lsucpd. The direction that
power is flowing is indicated by "====>>" or "<<====" between each
port<n> and port<n>-partner.

Project Status
--------------
Can do:
     - show relationship between USB Type C objects (e.g. port0 and
       port1-partner) and "usb_power_delivery" objects (e.g. pd1 and pd7)
     - show the source and sink capabilities of both ends of existing
       PD connections
Cannot do (yet):
     - show the PD contract that is active. In USB PD jargon this requires
       the active RDO to be visible via sysfs
     - output JSON instead of plain text
     - show the actual voltage and current (and its direction) at the
       time this utility is executed

Warning:
--------
This project should be regarded as "work-in-progress" due to its immaturity
and the kernel support could be summarized as "shaky". Often after removing
and reconnecting USB-C cables carrying power, the ucsi_acpi and typec_ucsi
modules need to be removed then re-installed on the test platform. That
does not inspire confidence.

Code
----
Build and install instructions plus some binaries can be found at the
bottom of the README at: https://github.com/doug-gilbert/lsucpd

The code at that location includes a manpage with examples.

Feedback welcome.

Doug Gilbert
