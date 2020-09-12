Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84834267763
	for <lists+linux-usb@lfdr.de>; Sat, 12 Sep 2020 05:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725771AbgILDKh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Sep 2020 23:10:37 -0400
Received: from sonic315-22.consmr.mail.ne1.yahoo.com ([66.163.190.148]:43498
        "EHLO sonic315-22.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725768AbgILDKf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Sep 2020 23:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1599880234; bh=DoOGMeT+rzDkU+yXqlGJSeN+NYryD3fNpUhnbWupp98=; h=Date:From:Reply-To:Subject:References:From:Subject; b=KsTlTXySzzoL8zmJbfxd5rK1D4hWi+PdOc4IXdPWQ3nqE8sOfx0/fXnV/49mUzByReeDF+JtW5+5YxLg4iSkjCpLMlhI78oNrRrmR9iyWqwf5BOOOZkm5dr4gTYqUISYBEPjS2In7LVSq/whG77LbmLtnZG+puHhHLQrTcAhUFfLoFuBK/FHAoPphzYXzfFqQU1+Uqg6qi2oo+1OYrqVRNdL2RLVHK4iIkx668JdYFyHp3jPQ8j/MbUM8lcqNyuTvHYw5y2ZaW5ahCppAVbAJyPWRFrD6iIsAT1BzHodWZ8Xbl7B2DxLVlexNlyxAFNQ0nWQvg46fkqgNiPY0z/QOg==
X-YMail-OSG: iTVZwgwVM1nzdp5M4m6NjxcIRl6DPCj16NVYLsMN89Fksj1ugttv2CGMiXDCjt3
 Sa7H0HJ3KQ51nAlePnLWG7gw5P28alfV3sQ.C949Y3EmDn.ZskKc5p_A6lt7Mn_yd128aNnay1E0
 PhX3cFfNSL5XaWU9s6qeG0cg.NBQAjyv8KJ7GMen2jr2uoW1FqeXFt8EWwj7RuZA7V7YoVFzmldm
 I20hmR8Qr1S7ELL2oEJZ7NwFQIRggGIT2RGs2d3pDpUfHAAdFwKzydgPbjuVjVLz0W91MKQ7tQ7x
 zY.Bus6oljcqaMYPBi5aMVGTxMxnhuhiaG1qySqA8PFFy9vd8f4ZgAohadBQhd56O2YwMGMF63l2
 g4AIES2D6qmy70.4opq7pF5R.EBr5PX0pEkRFKFjk.S1mO_ZkXJMoKhU4hoj7R3_Qbx7BnXkWZ3w
 XkaTbu7ulybYEZooLJ9iJlwjYxaxzvFTkZC2Fuw4mlioqiw0CCjjHmXyBDcyHIp3z1uGs0m6_f9L
 38.Y0Li8ktH8HMHG5e5dqNJHgJYk92Jb66t3ASMwgth41LUXBOAfCkaWstQKTVCdDacTu_tBH1De
 OFiVEOYSxxUo6lq.U2fsoI7LLv.DpWYSKk9ytC9g9CcFnjIwsBsxZ8s1n3nHHK4mpoUI01EoJKgk
 xK2i3uYGB2.jVXNpDIZ2AyrtUIH09jNUs.xZSlv9dxok4AZjscraZ3a3qtKcnnSY4yN8XXferqd_
 C9frd67SFsZ8q5BTsO6A2wjhBBDlmFMBs5iD3QZcPlrdzwT11BYCM2OH9XeZKd9LhDk.DGUMJzaW
 P.BhPQpEZZG5K4X1WUTdmPCXtMTPRwB.knU1hnksK5mMFF70abUQOfh09ch84RD7RXz.67IomIlw
 yr5yAEZ8EA9qz5FnrNZ8SN54k08aIspWaRRYmmZNbUjQ7xRymRLYy20RfVUzClIujjxfnNVXbCcZ
 XU5hh2geK1Lf4n5OmjHhyw__08E7KQJum_Nd.w2KASC9fBoUoaw0811d_TEqHe4juV4Tlpd06vkw
 9ABorhhEs3kR8ZCg2l1LhVLV7a87e0T9C453NkVFBDYQEw1hk26nkp0.arA_sbT6hnv_9t.7d9eK
 _21MsYTeYPWmF95dzYrh8xBZkSZ_YgoaNMT4NTmPuD19yR.Aj_SLQARKAJY5rzgJl0Fgr1r.3.3R
 WWTWZDHnwz7nbABmArCM_QvNVsQmLbcqE4nWjUM8TLMnJ.YKAmKzSf6fDfuPNu1xgDaowSIYp7oB
 CuGF2AVcH_dddd1jgBZPPw5SNGS7iRDlwEGo6HO0flHp_e8mjnd3z4h_49KgxZuICr.pFsRCXP7J
 oSeInEElGtE03efsHGSL.UkB0qtvz.D97fZkgtOa64rRlzfrRj2CFKtPTREWTRsPSMPogXdP.uYc
 GfdQ_VQEhQq0eVm1SsoP4pkPk3MOEqxcaTrPg7cxwXZP4zMryLZYMeFdZFUn_SSEIuZiG1E_MP9R
 epYGwKsCm..6RgUJlew--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.ne1.yahoo.com with HTTP; Sat, 12 Sep 2020 03:10:34 +0000
Date:   Sat, 12 Sep 2020 03:10:34 +0000 (UTC)
From:   Sergeant Emad Alabbasi <mrszainabmadina.golf@gmail.com>
Reply-To: sergeantemad.alabbasi@gmail.com
Message-ID: <1540196259.1420701.1599880234583@mail.yahoo.com>
Subject: Hello,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1540196259.1420701.1599880234583.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16583 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,
 Hope I can trust you with the huge money I recently shared with my colleague during our peace keeping mission recently in an Oil reach area in Lybia.

The sum of $13.5 million US Dollars is my share and already with the company that will bring it to you for us to share 50% for you and mine 50%. 
Kindly reply for me to tell you everything directly [sergeantemad.alabbasi@gmail.com]

Thanks

Sergeant Emad Alabbasi
