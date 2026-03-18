Return-Path: <linux-usb+bounces-35086-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ1sOyE6u2mJhAIAu9opvQ
	(envelope-from <linux-usb+bounces-35086-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 00:49:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0762C3ED2
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 00:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B00F3145422
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 23:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71DE348465;
	Wed, 18 Mar 2026 23:47:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from r9216.ps.combzmail.jp (r9216.ps.combzmail.jp [160.16.66.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24BA1C84B8
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 23:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.16.66.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773877639; cv=none; b=uU9aJc0SuoQfypSZHi5fb74ESoBMnVVzlIESNY1FjgCmQROZLBWUJAZFkn2M6H6nMGg7qAG3SGIozWbg4jBy0yuT6cFMCtWW63u+amg4s3LHZlzfhG+qdspzSji8AioprFFP6wGOTJUItiI+1JVy8MZB4yHvJ+Z0aCD1X82QPyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773877639; c=relaxed/simple;
	bh=QQ+3gEbhGo+AoipHB9xiZytr5r9L1Ma7CYIdP1mEhBk=;
	h=To:From:Subject:Mime-Version:Content-Type:Message-Id:Date; b=F57XlUZ6IfChUmzazo24d8d0DJ2+vzo/lqFwtU7xXL9LW7vRxzZ4srrA5OW2DGPU380FC6xqh7kC4qYdIR37IwRRY11L7SEEgM6a52CRCrYhk8vui/Kvb2pl77KTQxizk+C5MyrtFYBQ0PuGTk36D/TpDjDhGKnLLJ/jWxddx2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knowledge-seminar.jp; spf=pass smtp.mailfrom=magerr.combzmail.jp; arc=none smtp.client-ip=160.16.66.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knowledge-seminar.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magerr.combzmail.jp
Received: by r9216.ps.combzmail.jp (Postfix, from userid 99)
	id 174BFFEA78; Thu, 19 Mar 2026 08:46:27 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 r9216.ps.combzmail.jp 174BFFEA78
To: linux-usb@vger.kernel.org
From: =?ISO-2022-JP?B?GyRCP0BFRCE/JUolbCVDJTglaiVzJS8bKEI=?= <info@knowledge-seminar.jp>
X-Ip: 1166592785788633
X-Ip-source: k85gj72848dnsad1u0p6gd
Precedence: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Subject: =?ISO-2022-JP?B?GyRCPFJEOSROGyhCTkcbJEI5VEYwGyhC?=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
X-MagazineId: 28d1
X-uId: 6764245737486059715077191009
X-Sender: CombzMailSender
X-Url: http://www.combzmail.jp/
Message-Id: <20260318234710.174BFFEA78@r9216.ps.combzmail.jp>
Date: Thu, 19 Mar 2026 08:46:27 +0900 (JST)
X-Spamd-Result: default: False [10.28 / 15.00];
	FUZZY_DENIED(9.94)[1:f37ffecbe3:0.68:txt];
	MV_CASE(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[knowledge-seminar.jp];
	TAGGED_FROM(0.00)[bounces-35086-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[info@knowledge-seminar.jp,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.735];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[knowledge-corp.jp:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fc-knowledgelink-corp.jp:url]
X-Rspamd-Queue-Id: 5D0762C3ED2
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

　お世話になります。ナレッジリンクセミナー事務局です。
　
　
　「社員のモチベーションを上げようと声をかける」
　「部下の相談に乗り、一緒に悩んであげる」
　「現場のトラブルに、自ら先頭に立って対応する」
　
　もし社長がこれらを率先しているようであれば、
　残念ながら、その組織の成長はそこで止まります。
　
　社長のその“優しさ”が、社員の甘えを生み、責任感を奪い、
　「指示待ち人間」を量産する装置になっているからです。
　
　
　4,800社の経営者が衝撃を受けた、
　良かれと思ってやってしまう「社長のNG行動」の正体。
　
　組織を劇的に変えるための、
　オンラインセミナーを開催いたします。
　
　1つでも心当たりがあれば、一度ご視聴ください。　
　
　>>視聴予約はこちら
　https://knowledge-corp.jp/shikigaku5/
　
----------------------------------------------
　
　テーマ ：　それ、危険です 『社長のNG行動』
　　　　　 〜 その行動が、組織崩壊を招く 〜
　

　日 程　： 3月19日（木）13:00〜15:00　残り14枠
　　　　　  4月14日（火）13:00&#12316;15:00
　　　　　  4月21日（火）13:00&#12316;15:00
　　　　　※どちらの日程も内容は同じ
　会 場　：Zoom開催
　定 員　：先着100名（費用は不要）
----------------------------------------------
　※経営層の方限定です
　
　
　なぜ、社員は「言われたこと」しかやらないのか。
　なぜ、次世代のリーダー候補が育たないのか。
　
　それは、能力の問題ではなく、
　
　良かれと思って続けている「社長の配慮」こそが、
　組織成長を止める、最大のボトルネックかもしれません。
　
　本セミナーでは、4,800社以上が導入した
　独自の組織論「識学」に基づき、社長の「NG行動」と
　真の経営者へ脱皮するためのマインドセットを伝授します。
　
　
　【セミナー内容(一部抜粋)】
　 ○ NG行動3選
　 ○ なぜ優秀なNo.2や部長が育たないのか
　 ○ マネジメントスタイルの変革について
　 ○ 導入企業の事例
　
　「管理職が育ったら任せる」ではなく「任せるから育つ」
　という思考の逆転を提言。
　
　現場から「冷たくなった」と思われることを恐れず、
　機能的な階層構造（仕組み）を作ることで

　結果として社員全員を守り、
　利益を最大化させる道筋を明示します。

　「優しさ」で人を動かすのではなく、
　「正しさ」で組織を動かす。

　音声やお顔が表に出ることはございませんので
　お気軽にご視聴ください。
　
　>>視聴予約はこちら
　https://knowledge-corp.jp/shikigaku5/
　
　
-----------------------
　一般社団法人 ナレッジリンク
　東京都千代田区神田小川町1-8-3
　電話：03-5256-7638

　セミナーのご案内が不要な方は大変残念ではございますが、
　下記URLより手続き下さいませ。
　
　メール配信のワンクリック解除はこちら
　https://fc-knowledgelink-corp.jp/mail/
　

