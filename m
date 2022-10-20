Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 335B26070A0
	for <lists+linux-usb@lfdr.de>; Fri, 21 Oct 2022 08:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiJUG7U convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 21 Oct 2022 02:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbiJUG7S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Oct 2022 02:59:18 -0400
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B362D244708
        for <linux-usb@vger.kernel.org>; Thu, 20 Oct 2022 23:59:17 -0700 (PDT)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRWlGSWpSXmKPExsWyc0WAsq6Tc1C
  ywb3vuhbHNs5htfh54jSrxfsdi9kttvwztpi+oI3V4tDdK0wW3ydOZbG4vuE+u8WxH0fYLdp/
  zWe2mLW0kc3i2cRT7BaLlrUyWxzY/ZPNonnJBCaLA5uXsVn8f7SS1eLIw7XsFqcfz2Wx6L3/i
  NlBxKPn5XV2j0fnpjJ6rL1m4fGrbS6zx73GO6weS+euZvfYMnEPs8ffYzdYPba3r2HxWLpoOY
  vHmutH2TwOXXPz+HmF2eP9vqtsHr8ntTB5nD27ky1AOIo1My8pvyKBNePolh7WgvVMFf8uXGJ
  uYGxg6mLk5BASKJFYd+kgC4jNK2An8WbCFnYQm1lAT+LG1ClsEHFBiZMzn7BAxLUlli18zdzF
  yAFkq0l87SoBCQsLmEj8vbuTFSQsIqAi8WYHN0iYDWjK/pbP7CBhFgFViU9rwyGWykhcXtTIN
  oGRexaSXbOQ7JqFZNcshF0LGFlWMZoVpxaVpRbpGprpJRVlpmeU5CZm5uglVukm6qWW6panFp
  foGukllhfrpRYX6xVX5ibnpOjlpZZsYgRGZ0qx4tYdjDeW/dE7xCjJwaQkyiukEJQsxJeUn1K
  ZkVicEV9UmpNafIhRj4ND4MLZh58YBa58+NTEJMWSl5+XqiTBO8URqFqwKDU9tSItMweYTGAa
  JDh4lER43zkApXmLCxJzizPTIVKnGPM5tu/cv5eZY/fx80ByyfeLQPLfxytA8sGBa0By6ux/+
  4HiYHI5mFwFJmd+bTvAzPF1WxeQPP1n+gFmIbArpMR5v4FcIQCyJqM0D+4IWHK9xCgrJczLyM
  DAIMRTkFqUm1mCKv+KUZyDUUmY1wtkCk9mXgncra+A3mACesN0ix/IGyWJCCmpBqZN5+fPOf0
  vqbVfcwf7LaOqbS0e+d/uGoSfdsje89lPc3LH+e4ZTv+r9bfN2Ln/9IknGWzp2wNvcD5PSWp5
  x2xTW/gxpj6SY49yvNcvs5O5XwJcZBV3hGS8+KDFdNT+wMWoiifPe36X/jWUM2R/2jXJ/NT35
  omLcnNfXI/veZL342MZu1ilTJGT0+ev9UJi7vlfK9tO94U8Fvn8IVY5rmPrW/6vP49nHeZgLc
  4yu2Aq/nqdwAqlfTXbBC17v12YIM//PajSm1V91RrBOPfVr16tnFn6UOVHjhL/xoOGNcI5Ue+
  ET7+3szjzLSM8RkK706RzLYfja4VbMmpfruy/HLA8cvOnFyzvOXL2zbIQ3KvEUpyRaKjFXFSc
  CADrXPw5KQQAAA==
X-Env-Sender: tianasime@gmail.com
X-Msg-Ref: server-4.tower-539.messagelabs.com!1666335554!213597!1
X-Originating-IP: [185.168.80.35]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7694 invoked from network); 21 Oct 2022 06:59:14 -0000
Received: from unknown (HELO VSRVDCF1106) (185.168.80.35)
  by server-4.tower-539.messagelabs.com with SMTP; 21 Oct 2022 06:59:14 -0000
Received: from [194.99.45.27] (Unknown [194.99.45.27])
        by VSRVDCF1106 with ESMTP
        ; Thu, 20 Oct 2022 17:03:15 +0200
Message-ID: <EF7C6737-4C9E-4FE8-8982-EBC5473C49E4@VSRVDCF1106>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Description: Mail message body
Subject: RE; Dear Customer we are still waiting!!!!!
To:     Recipients <tianasime@gmail.com>
From:   Mrs Sonia Anderson <tianasime@gmail.com>
Date:   Thu, 20 Oct 2022 08:03:13 -0700
Reply-To: bo979685@gmail.com
X-Spam-Status: Yes, score=7.3 required=5.0 tests=BAYES_50,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_SBL,SPF_HELO_NONE,SPF_SOFTFAIL,
        SPOOFED_FREEM_REPTO,T_HK_NAME_FM_MR_MRS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [194.99.45.27 listed in zen.spamhaus.org]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [195.245.231.4 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tianasime[at]gmail.com]
        *  0.7 SPF_SOFTFAIL SPF: sender does not match SPF record (softfail)
        *  0.0 DKIM_ADSP_CUSTOM_MED No valid author signature, adsp_override
        *      is CUSTOM_MED
        *  1.0 FORGED_GMAIL_RCVD 'From' gmail.com does not match 'Received'
        *      headers
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [bo979685[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 RCVD_IN_MSPIKE_H2 RBL: Average reputation (+2)
        *      [195.245.231.4 listed in wl.mailspike.net]
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.9 NML_ADSP_CUSTOM_MED ADSP custom_med hit, and not from a mailing
        *       list
        *  2.5 SPOOFED_FREEM_REPTO Forged freemail sender with freemail
        *      reply-to
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Bank of America
Charlotte, North Carolina, United States
North Tryon Street, Charlotte, NC 28255
Text/Fax: Ext-8-1-0880.050.640
email;bo979685@gmail.com

Dear Customer,

We are still waiting for your reply to our last email which was sent to you .

Thanks,
Sonia Anderson
Financial Inquiries Unit 

