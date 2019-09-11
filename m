Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6BA9AFD28
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2019 14:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbfIKMyw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Sep 2019 08:54:52 -0400
Received: from rfoutemea1.hes.trendmicro.eu ([52.58.63.51]:56992 "EHLO
        rfoutemea1.hes.trendmicro.eu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727806AbfIKMyw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Sep 2019 08:54:52 -0400
X-Greylist: delayed 1181 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Sep 2019 08:54:51 EDT
Received: from 0.0.0.0_hes.trendmicro.com (unknown [192.168.11.221])
        by rfoutemea1.hes.trendmicro.eu (Postfix) with ESMTPS id 7AE9A4B075F
        for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2019 12:35:10 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [192.168.13.134])
        by routemea2.hes.trendmicro.eu (Postfix) with SMTP id 35DA8510069
        for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2019 12:35:09 +0000 (UTC)
Received: from mail.lan.thesycon.de (unknown [80.88.23.201])
        by relayemea3.hes.trendmicro.eu (TrendMicro Hosted Email Security) with ESMTP id AB8696EA05A
        for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2019 12:35:08 +0000 (UTC)
Received: from [192.168.1.106] (ue1.lan.thesycon.de [192.168.1.106])
        by mail.lan.thesycon.de (Postfix) with ESMTP id 84D69E847B7
        for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2019 14:35:08 +0200 (CEST)
To:     linux-usb@vger.kernel.org
From:   Udo Eberhardt <udo.eberhardt@thesycon.de>
Subject: usb: gadget: f_fs: Question on descriptor parsing in f_fs.c
Message-ID: <aeeeb7d2-3a44-d11a-bee9-e4e2df7447e1@thesycon.de>
Date:   Wed, 11 Sep 2019 14:35:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TMASE-Version: StarCloud-1.3-8.5.1020-24904.006
X-TMASE-Result: 10--0.378200-4.000000
X-TMASE-MatchedRID: 0eRUN7oaBN+MkFI4QIufqklR2DE0NRdaMOhRB5C/8I/xBB/ThHC4Mn6d
        LtafLqO8ag0GuAAxFGFrkYv5jGLcsbI9IhPaTqbkboe6sMfg+k8Ea8g1x8eqF1pL53A87aJbddD
        NUlHYqIgbfReKr9fckmSpu2vb1QC02vb713uVhGuWAT2bUHJRZ/RLPzmkXadUtFoIKiiSyUOeAi
        CmPx4NwLTrdaH1ZWqCZYJ9vPJ1vSDUCjMSsLl1x+TCMddcL/gjymsk/wUE4hoIy2+6rlJrlhD04
        tJT/eD3GKQkbQ/FQMfZaW5L3ooIRzyajuK/mHiaDREYT6RnNsV2ViqQjbr+cVp+5ibgSRkmlnPK
        z+Afdrki2Da25f3azte2UU87qNJb9QRUdZkLkz07AmWJfZlCp+80ZJ3L3v/8
X-TM-Deliver-Signature: 194CD20E8E1C79F9AEFF5B57CF181067
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

We are currently trying to implement an UAC2 function in user mode based 
on f_fs. We found that descriptor parsing in f_fs.c does not support 
audio (or video) class descriptors. We could develop a patch to add 
UAC1/UAC2 handling. But before we do that I wanted to check if this is 
the right approach.

My question: Is f_fs limited by design to simple device classes like HID 
or CCID, or is it supposed to support arbitrary classes? In the latter 
case descriptor parsing needs to be extended significantly to handle the 
non-trivial cases.

Best regards,
Udo

